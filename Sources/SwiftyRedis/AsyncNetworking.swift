//
//  AsyncNWConnection.swift
//  
//
//  Created by Michael van Straten on 27.05.23.
//

import Foundation
import Network

final class AsyncNWConnection {
    let con: NWConnection

    init(_ actualConnection: NWConnection) {
        con = actualConnection
    }
    
    struct DataStream: AsyncSequence {
        typealias Element = UInt8
        
        let con: AsyncNWConnection
        var data: Data = Data()
        
        struct AsyncIterator: AsyncIteratorProtocol {
            var data: Data
            let con: AsyncNWConnection
            
            mutating func next() async throws -> UInt8? {
                if self.data.count <= 0 {
                    let newData = try await self.con.recieve(minimumIncompleteLength: 0, maximumLength: .max)
                    
                    guard let newData = newData else {
                        return nil
                    }
                    
                    self.data.append(newData)
                }
                
                return data.popFirst()
            }
        }
        
        func makeAsyncIterator() -> AsyncIterator {
            AsyncIterator(data: data, con: self.con)
        }
    }
    
    func dataStream() -> DataStream {
        DataStream(con: self)
    }
    
    func send(content: Data?, contentContext: NWConnection.ContentContext = .defaultMessage, isComplete: Bool = true) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.con.send(
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
    
    func recieve(minimumIncompleteLength: Int, maximumLength: Int) async throws -> Data? {
        try await withCheckedThrowingContinuation { continuation in
            self.con.receive(minimumIncompleteLength: minimumIncompleteLength, maximumLength: maximumLength) { data, _, _, network_error in
                if let network_error = network_error {
                    continuation.resume(throwing: network_error)
                } else {
                    continuation.resume(returning: data)
                }
            }
        }
    }
    
    func start(queue: DispatchQueue) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            con.stateUpdateHandler = { newState in
                switch newState {
                case let .waiting(error), let .failed(error):
                    self.con.stateUpdateHandler = nil
                    continuation.resume(throwing: error)
                case .ready:
                    self.con.stateUpdateHandler = nil
                    continuation.resume()
                case .cancelled:
                    self.con.restart()
                default:
                    break
                }
            }
            con.start(queue: queue)
        }
    }
}
