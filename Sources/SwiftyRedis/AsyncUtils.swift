//
//  AsyncNetworking.swift
//
//
//  Created by Michael van Straten on 27.05.23.
//

import Foundation
import Network
@_spi(AsyncChannel) import NIOCore

/**
 A struct representing an asynchronous data stream.
 */
struct AsyncDataStream {
    var con: NIOAsyncChannelInboundStream<ByteBuffer>.AsyncIterator
    var buffer: ByteBuffer = ByteBuffer()

    /**
     Polls for new data and appends it to the buffer.
     */
    private mutating func poll() async throws {
        if let new_data = try await con.next() {
            buffer.writeImmutableBuffer(new_data)
        }
    }

    /**
     Checks if there is insufficient data in the buffer.
     - Parameter requiredAmount: The required amount of data.
     - Returns: `true` if there is insufficient data, `false` otherwise.
     */
    private func hasInsufficientData(requiredAmount: Int) -> Bool {
        return requiredAmount > buffer.readableBytes
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

        return buffer.readBytes(length: 1)![0]
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
        
        return Data(self.buffer.readBytes(length: n)!)
    }

    /**
     Retrieves data from the data stream until a specific subsequence is found.
     - Parameter subsequence: The subsequence to search for.
     - Returns: The retrieved data.
     */
    mutating func nextUntil<S: DataProtocol>(subsequence: S) async throws -> Data {
        var range = buffer.readableBytesView.firstRange(of: subsequence)
        while range == nil {
            try await poll()
            range = buffer.readableBytesView.firstRange(of: subsequence)
        }

        return try await next(n: range!.lowerBound - buffer.readableBytesView.startIndex)
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
