//
//  Pipeline.swift
//  
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

/**
 A pipeline allows you to send multiple commands in one go to the
 redis server. API wise it's very similar to just using a command
 but it allows multiple commands to be chained and some features such
 as iteration are not available.
 */

public class RedisPipeline {
    private var commands: Array<Cmd> = []
    
    internal func pack_pipeline() -> Data {
        var packed_pipeline = Data()
        for cmd in commands {
            packed_pipeline.append(contentsOf: cmd.pack_command())
        }
        return packed_pipeline
    }
    
    /// Adds a command to the pipeline.
    /// - Parameter cmd: the Command to add to the pipeline
    /// - Returns: the pipeline it self
    @discardableResult
    public func add_command(_ cmd: Cmd) -> Self {
        self.commands.append(cmd)
        return self
    }
    
    /// Starts a new command. Functions such as ``RedisPipeline/arg(_:)`` then become
    /// available to add more arguments to that command.
    @discardableResult
    public func cmd(_ name: String) -> Self {
        self.add_command(Cmd(name))
    }
    
    /// Adds an argument to the last started command. This works similar
    /// to the ``Cmd/arg(_:)``  method of the ``Cmd`` struct.
    ///
    /// Note that this function does nothing if there are no commands in the pipeline.
    @discardableResult
    public func arg<T: ToRedisArgs>(_ arg: T) -> Self {
        if let current_cmd = self.commands.last {
            current_cmd.arg(arg)
        }
        return self
    }
    
    /// Sends the Pipeline as query to the connection and converts the result to the target redis value.
    public func query<T: FromRedisValue>(_ con: RedisConnection) async throws -> T {
        let value = try await con.request_packed_cmd(pack_pipeline())
        return try T.init(value)
    }
    
    /// This is a shortcut to ``RedisPipeline/query(_:)`` that does not return a ``RedisValue`` and will throw if the query fails because of an error.
    public func exec(_ con: RedisConnection) async throws {
        let _: RedisValue = try await query(con)
    }
}
