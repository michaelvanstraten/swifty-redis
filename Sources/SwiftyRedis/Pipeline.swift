//
//  Pipeline.swift
//
//
//  Created by Michael van Straten on 21.07.22.
//

import Foundation

/**
 A RedisPipeline allows you to send multiple commands to the Redis server in a single operation.

 It provides a similar API to individual commands but enables chaining multiple commands together.
 */
public class RedisPipeline {
    private var commands: [Cmd] = []

    /**
     Packs the pipeline into a binary format that can be sent to the Redis server.

     - Returns: The packed pipeline as ``Data``.
     */
    internal func pack_pipeline() -> Data {
        var packed_pipeline = Data()
        for cmd in commands {
            packed_pipeline.append(contentsOf: cmd.pack_command())
        }
        return packed_pipeline
    }

    /**
     Adds a command to the pipeline.

     - Parameter cmd: The command to add to the pipeline.
     - Returns: The pipeline itself.
     */
    @discardableResult
    public func add_command(_ cmd: Cmd) -> Self {
        commands.append(cmd)
        return self
    }

    /**
     Starts a new command. Additional arguments can be added to the command using the ``RedisPipeline/arg(_:)`` method.

     - Parameter name: The name of the command.
     - Returns: The pipeline itself.
     */
    @discardableResult
    public func cmd(_ name: String) -> Self {
        add_command(Cmd(name))
    }

    /**
     Adds an argument to the last started command. This method works similar to the ``Cmd/arg(_:)`` method of the ``Cmd`` struct.

     Note: This function does nothing if there are no commands in the pipeline.

     - Parameter arg: The argument to add to the command.
     - Returns: The pipeline itself.
     */
    @discardableResult
    public func arg<T: ToRedisArgs>(_ arg: T) -> Self {
        if let current_cmd = commands.last {
            current_cmd.arg(arg)
        }
        return self
    }

    /**
     Sends the pipeline as a query to the Redis connection and converts the result to the specified Redis value type.

     - Parameter con: The ``RedisConnection`` to send the query to.
     - Returns: The result of the query as the specified Redis value type.
     - Throws: An error if the query fails.
     */
    public func query<T: FromRedisValue>(_ con: RedisConnection) async throws -> T {
        let values = try await con.request_packed_cmds(pack_pipeline(), count: self.commands.count)
        return try T(RedisValue.Array(values))
    }

    /**
     Executes the pipeline as a query to the Redis connection.

     This is a shortcut to the ``query(_:)`` method that does not return a ``RedisValue`` and will throw an error if the query fails.

     - Parameter con: The Redis connection to send the query to.
     - Throws: An error if the query fails.
     */
    public func exec(_ con: RedisConnection) async throws {
        let _: RedisValue = try await query(con)
    }
}
