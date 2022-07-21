//
//  File.swift
//  
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

public class RedisPipeline {
    private var cmds: Array<Cmd> = []
    
    internal func pack_pipeline() -> Data {
        var packed_pipeline = Data()
        for cmd in cmds {
            packed_pipeline.append(contentsOf: cmd.pack_command())
        }
        return packed_pipeline
    }
    
    @discardableResult
    public func add_command(_ cmd: Cmd) -> Self {
        self.cmds.append(cmd)
        return self
    }
    
    @discardableResult
    public func cmd(_ name: String) -> Self {
        self.add_command(Cmd(name))
    }
    
    @discardableResult
    public func arg<T: ToRedisArgs>(_ arg: T) -> Self {
        if let current_cmd = self.cmds.last {
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
    /// This is mainly useful in examples and for simple commands like setting keys.
    public func exec(_ con: RedisConnection) async throws {
        let _: RedisValue = try await query(con)
    }
}

extension RedisPipeline: RedisCommands {
    public func process_command(_ cmd: Cmd) -> Self {
        self.add_command(cmd)
    }
}
