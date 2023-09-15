//
//  object.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns the logarithmic access frequency counter of a Redis object.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT FREQ](https://redis.io/commands/object-freq)
    public func object_freq<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("OBJECT").arg("FREQ").arg(key)
        return try await cmd.query(self)
    }
    /// Returns the logarithmic access frequency counter of a Redis object.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT FREQ](https://redis.io/commands/object-freq)
    public func object_freq(_ key: String) async throws {
        let cmd = Cmd("OBJECT").arg("FREQ").arg(key)
        try await cmd.exec(self)
    }
    /// Returns the reference count of a value of a key.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT REFCOUNT](https://redis.io/commands/object-refcount)
    public func object_refcount<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("OBJECT").arg("REFCOUNT").arg(key)
        return try await cmd.query(self)
    }
    /// Returns the reference count of a value of a key.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT REFCOUNT](https://redis.io/commands/object-refcount)
    public func object_refcount(_ key: String) async throws {
        let cmd = Cmd("OBJECT").arg("REFCOUNT").arg(key)
        try await cmd.exec(self)
    }
    /// Returns the time since the last access to a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT IDLETIME](https://redis.io/commands/object-idletime)
    public func object_idletime<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("OBJECT").arg("IDLETIME").arg(key)
        return try await cmd.query(self)
    }
    /// Returns the time since the last access to a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT IDLETIME](https://redis.io/commands/object-idletime)
    public func object_idletime(_ key: String) async throws {
        let cmd = Cmd("OBJECT").arg("IDLETIME").arg(key)
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT HELP](https://redis.io/commands/object-help)
    public func object_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("OBJECT").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT HELP](https://redis.io/commands/object-help)
    public func object_help() async throws {
        let cmd = Cmd("OBJECT").arg("HELP")
        try await cmd.exec(self)
    }
    /// Returns the internal encoding of a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT ENCODING](https://redis.io/commands/object-encoding)
    public func object_encoding<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("OBJECT").arg("ENCODING").arg(key)
        return try await cmd.query(self)
    }
    /// Returns the internal encoding of a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT ENCODING](https://redis.io/commands/object-encoding)
    public func object_encoding(_ key: String) async throws {
        let cmd = Cmd("OBJECT").arg("ENCODING").arg(key)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns the logarithmic access frequency counter of a Redis object.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT FREQ](https://redis.io/commands/object-freq)
    public func object_freq(_ key: String) -> Self {
        let cmd = Cmd("OBJECT").arg("FREQ").arg(key)
        return self.add_command(cmd)
    }
    /// Returns the reference count of a value of a key.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT REFCOUNT](https://redis.io/commands/object-refcount)
    public func object_refcount(_ key: String) -> Self {
        let cmd = Cmd("OBJECT").arg("REFCOUNT").arg(key)
        return self.add_command(cmd)
    }
    /// Returns the time since the last access to a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT IDLETIME](https://redis.io/commands/object-idletime)
    public func object_idletime(_ key: String) -> Self {
        let cmd = Cmd("OBJECT").arg("IDLETIME").arg(key)
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT HELP](https://redis.io/commands/object-help)
    public func object_help() -> Self {
        let cmd = Cmd("OBJECT").arg("HELP")
        return self.add_command(cmd)
    }
    /// Returns the internal encoding of a Redis object.
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [OBJECT ENCODING](https://redis.io/commands/object-encoding)
    public func object_encoding(_ key: String) -> Self {
        let cmd = Cmd("OBJECT").arg("ENCODING").arg(key)
        return self.add_command(cmd)
    }
}
