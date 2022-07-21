//
//  File.swift
//  
//
//  Created by Michael Van straten on 05.07.22.
//

import Foundation
import Network

/// A connection is an object that represents a single redis connection.
/// ## Overview
/// It provides basic support for sending encoded commands into a redis connection
/// and to read a response from it. It's bound to a single database and can
/// only be created from the ``RedisClient``.
public class RedisConnection {
    var con: NWConnection
    var command_to_process: Cmd?
    let parser: RedisResponseParser
    
    internal init(_ actual_connection: NWConnection) {
        con = actual_connection
        parser = RedisResponseParser()
        command_to_process = nil
    }
    
    private func send_packed_command(_ cmd: Data) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            self.con.send(
                content: cmd,
                completion: .contentProcessed({ error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(returning: Void())
                    }
                })
            )
        }
    }
    
    private func receive_response() async throws -> RedisValue {
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
    
    /// Sends an already encoded (packed) command into the TCP socket and reads a response.
    /// The command should conform to the [RESP protocol description](https://redis.io/docs/reference/protocol-spec/#resp-protocol-description).
    /// The appropriate constants for implementing the protocol can be found here in the ``RedisRESP`` struct.
    public func request_packed_cmd(_ cmd: Data) async throws -> RedisValue {
        try await send_packed_command(cmd)
        return try await receive_response()
    }
}

extension RedisConnection: RedisCommands {
    public func process_command(_ cmd: Cmd) -> Self {
        self.command_to_process = cmd
        return self
    }
    
    /// Sends the command as query to the connection and converts the result to the target redis value.
    /// This is the general way how you can retrieve data.
    public func query<T: FromRedisValue>() async throws -> T {
        if let cmd = self.command_to_process {
            let value = try await self.request_packed_cmd(cmd.pack_command())
            return try T.init(value)
        }
        return try T.init(.Nil)
    }
    
    /// This is a shortcut to ``RedisConnection/query()`` that does not return a ``RedisValue`` and will throw if the query fails because of an error.
    /// This is mainly useful in examples and for simple commands like setting keys.
    public func exec() async throws {
        let _: RedisValue = try await query()
    }
}
