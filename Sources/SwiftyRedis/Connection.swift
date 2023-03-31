//
//  Connection.swift
//
//
//  Created by Michael Van straten on 05.07.22.
//

import Foundation
import Network
import Semaphore

/**
 A connection is an object that represents a single redis connection.

 ## Overview
 It provides basic support for sending encoded commands into a redis connection
 and to read a response from it. It's bound to a single database and can
 only be created from the ``RedisClient``.
 */
public class RedisConnection {
    var con: NWConnection
    let parser: RedisResponseParser
    let semaphore: AsyncSemaphore

    internal init(_ actual_connection: NWConnection) {
        con = actual_connection
        parser = RedisResponseParser()
        semaphore = AsyncSemaphore(value: 1)
    }

    internal func send_packed_command(_ cmd: Data) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.con.send(
                content: cmd,
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

    internal func receive_response() async throws -> RedisValue {
        try await withCheckedThrowingContinuation { continuation in
            self.con.receive(minimumIncompleteLength: 0, maximumLength: .max) { data, _, _, network_error in
                if let network_error = network_error {
                    continuation.resume(throwing: network_error)
                } else {
                    do {
                        let value = try self.parser.parse_response(data ?? Data())
                        continuation.resume(returning: value)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }

    /// Sends an already encoded command into the TCP socket and reads a response.
    /// The command should conform to the [RESP protocol description](https://redis.io/docs/reference/protocol-spec/#resp-protocol-description).
    /// The appropriate constants for implementing the protocol can be found here in the ``RedisRESP`` struct.
    public func request_packed_cmd(_ cmd: Data) async throws -> RedisValue {
        await semaphore.wait()
        defer {
            semaphore.signal()
        }
        try await send_packed_command(cmd)
        return try await receive_response()
    }
}
