//
//  object.swift
//
//
//  Created by CodeGen on 14.09.23.
//
import Foundation
extension RedisConnection {
    /// Get the logarithmic access frequency counter of a Redis object
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
    /// Get the logarithmic access frequency counter of a Redis object
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
    /// Get the number of references to the value of the key
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
    /// Get the number of references to the value of the key
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
    /// Get the time since a Redis object was last accessed
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
    /// Get the time since a Redis object was last accessed
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
    /// Show helpful text about the different subcommands
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
    /// Show helpful text about the different subcommands
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
    /// Inspect the internal encoding of a Redis object
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
    /// Inspect the internal encoding of a Redis object
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
    /// Get the logarithmic access frequency counter of a Redis object
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
    /// Get the number of references to the value of the key
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
    /// Get the time since a Redis object was last accessed
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
    /// Show helpful text about the different subcommands
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
    /// Inspect the internal encoding of a Redis object
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
