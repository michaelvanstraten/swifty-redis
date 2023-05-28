//
//  AsyncNetworking.swift
//
//
//  Created by Michael van Straten on 27.05.23.
//

import Foundation
import Network

/**
 A struct representing an asynchronous data stream.
 */
struct AsyncDataStream {
    let con: NWConnection
    var buffer: Data = .init()

    /**
     Polls for new data and appends it to the buffer.
     */
    private mutating func poll() async throws {
        switch try await con.recieve(minimumIncompleteLength: 0, maximumLength: .max) {
        case let .some(newData):
            buffer.append(newData)
        case .none:
            return
        }
    }

    /**
     Checks if there is insufficient data in the buffer.
     - Parameter requiredAmount: The required amount of data.
     - Returns: `true` if there is insufficient data, `false` otherwise.
     */
    private func hasInsufficientData(requiredAmount: Int) -> Bool {
        return requiredAmount > buffer.count
    }
}

extension AsyncDataStream {
    /**
     Retrieves the next byte from the data stream.
     - Returns: The next byte.
     */
    mutating func next() async throws -> UInt8 {
        while hasInsufficientData(requiredAmount: 1) {
            try await poll()
        }

        return buffer.popFirst()!
    }

    /**
     Retrieves the next `n` bytes from the data stream.
     - Parameter n: The number of bytes to retrieve.
     - Returns: The retrieved data.
     */
    mutating func next(n: Int) async throws -> Data {
        if n == 0 {
            return Data()
        }

        while hasInsufficientData(requiredAmount: n) {
            try await poll()
        }

        return Data((1 ... n).map { _ in self.buffer.removeFirst() })
    }

    /**
     Retrieves data from the data stream until a specific subsequence is found.
     - Parameter subsequence: The subsequence to search for.
     - Returns: The retrieved data.
     */
    mutating func nextUntil<S: DataProtocol>(subsequence: S) async throws -> Data {
        var range = buffer.firstRange(of: subsequence)
        while range == nil {
            try await poll()
            range = buffer.firstRange(of: subsequence)
        }

        return try await next(n: range!.lowerBound - buffer.indices.lowerBound)
    }
}

extension NWConnection {
    /**
     Creates an ``AsyncDataStream`` from the current connection.
     - Returns: An ``AsyncDataStream` instance.
     */
    func dataStream() -> AsyncDataStream {
        AsyncDataStream(con: self)
    }
}

extension NWConnection {
    /**
     Starts the connection asynchronously.
     - Parameters:
     - queue: The dispatch queue to use for handling events.
     - Throws: An error if the connection fails to start.
     */
    func start(queue: DispatchQueue) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.stateUpdateHandler = { newState in
                switch newState {
                case let .waiting(error), let .failed(error):
                    self.stateUpdateHandler = nil
                    continuation.resume(throwing: error)
                case .ready:
                    self.stateUpdateHandler = nil
                    continuation.resume()
                case .cancelled:
                    self.restart()
                default:
                    break
                }
            }
            self.start(queue: queue)
        }
    }

    /**
     Sends data over the connection asynchronously.
     - Parameters:
        - content: The data to send.
        - contentContext: The context for the content being sent.
        - isComplete: A flag indicating if the content is complete.
     - Throws: An error if the send operation fails.
     */
    func send(content: Data?, contentContext _: NWConnection.ContentContext = .defaultMessage, isComplete _: Bool = true) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.send(
                content: content,
                completion: .contentProcessed { error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(returning: ())
                    }
                }
            )
        }
    }

    /**
     Receives data from the connection asynchronously.
     - Parameters:
        - minimumIncompleteLength: The minimum length of incomplete data to receive.
        - maximumLength: The maximum length of data to receive.
     - Returns: The received data, or `nil` if no data is available.
     - Throws: An error if the receive operation fails.
     */
    func recieve(minimumIncompleteLength: Int, maximumLength: Int) async throws -> Data? {
        try await withCheckedThrowingContinuation { continuation in
            self.receive(minimumIncompleteLength: minimumIncompleteLength, maximumLength: maximumLength) { data, _, _, network_error in
                if let network_error = network_error {
                    continuation.resume(throwing: network_error)
                } else {
                    continuation.resume(returning: data)
                }
            }
        }
    }
}

/**
 Maps each element of the sequence asynchronously.

 - Parameter transform: A closure that takes an element of the sequence as a parameter and returns a transformed value.
 - Returns: An array containing the transformed values.
 - Throws: Errors thrown by the `transform` closure.
 - Note: This extension method is used internally by the ``ResponseValueParser`` and ``RedisPipeline`` class.
  */
extension Sequence {
    func mapAsync<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
