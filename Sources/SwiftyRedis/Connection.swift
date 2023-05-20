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
 A connection is an object that represents a single Redis connection.

 ## Overview
 The ``RedisConnection`` class provides basic support for sending encoded commands to a Redis connection and reading responses from it.
 It is bound to a single database and can only be created from the ``RedisClient` class.
 */
public class RedisConnection {
    var con: NWConnection
    let parser: RedisResponseParser
    let semaphore: AsyncSemaphore

    /**
     Initializes a Redis connection object.

     - Parameter actual_connection: The underlying network connection.
     */
    internal init(_ actual_connection: NWConnection) {
        con = actual_connection
        parser = RedisResponseParser()
        semaphore = AsyncSemaphore(value: 1)
    }

    /**
     Sends a packed command to the Redis server asynchronously.

     - Parameter cmd: The packed command data to be sent.
     - Throws: An error if the command sending fails.
     */
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

    /**
     Receives a Redis response from the server asynchronously.

     - Returns: The parsed Redis value representing the response.
     - Throws: An error if the response cannot be received or parsed.
     */
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

    /**
     Sends an already encoded command to the Redis server and reads the response.

     The command should conform to the [RESP protocol description](https://redis.io/docs/reference/protocol-spec/#resp-protocol-description),
     appropriate constants for implementing the protocol can be found here in the ``RedisRESP`` struct.

     - Parameter cmd: The packed command data to be sent.
     - Returns: The parsed ``RedisValue`` representing the response.
     - Throws: An error if the command sending or response receiving fails.
     */
    public func request_packed_cmd(_ cmd: Data) async throws -> RedisValue {
        await semaphore.wait()
        defer {
            semaphore.signal()
        }
        try await send_packed_command(cmd)
        return try await receive_response()
    }
}
