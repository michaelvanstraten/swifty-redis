//
//  memory.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns details about memory usage.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY STATS](https://redis.io/commands/memory-stats)
    public func memory_stats<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY").arg("STATS")
        return try await cmd.query(self)
    }
    /// Returns details about memory usage.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY STATS](https://redis.io/commands/memory-stats)
    public func memory_stats() async throws {
        let cmd = Cmd("MEMORY").arg("STATS")
        try await cmd.exec(self)
    }
    /// Asks the allocator to release memory.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY PURGE](https://redis.io/commands/memory-purge)
    public func memory_purge<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY").arg("PURGE")
        return try await cmd.query(self)
    }
    /// Asks the allocator to release memory.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY PURGE](https://redis.io/commands/memory-purge)
    public func memory_purge() async throws {
        let cmd = Cmd("MEMORY").arg("PURGE")
        try await cmd.exec(self)
    }
    /// Outputs a memory problems report.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY DOCTOR](https://redis.io/commands/memory-doctor)
    public func memory_doctor<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY").arg("DOCTOR")
        return try await cmd.query(self)
    }
    /// Outputs a memory problems report.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY DOCTOR](https://redis.io/commands/memory-doctor)
    public func memory_doctor() async throws {
        let cmd = Cmd("MEMORY").arg("DOCTOR")
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY HELP](https://redis.io/commands/memory-help)
    public func memory_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY HELP](https://redis.io/commands/memory-help)
    public func memory_help() async throws {
        let cmd = Cmd("MEMORY").arg("HELP")
        try await cmd.exec(self)
    }
    /// Estimates the memory usage of a key.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of samples.
    /// ## Documentation
    /// view the docs for [MEMORY USAGE](https://redis.io/commands/memory-usage)
    public func memory_usage<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("MEMORY").arg("USAGE").arg(key).arg((count != nil) ? "SAMPLES" : nil).arg(count)
        return try await cmd.query(self)
    }
    /// Estimates the memory usage of a key.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of samples.
    /// ## Documentation
    /// view the docs for [MEMORY USAGE](https://redis.io/commands/memory-usage)
    public func memory_usage(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("MEMORY").arg("USAGE").arg(key).arg((count != nil) ? "SAMPLES" : nil).arg(count)
        try await cmd.exec(self)
    }
    /// Returns the allocator statistics.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY MALLOC_STATS](https://redis.io/commands/memory-malloc-stats)
    public func memory_malloc_stats<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY").arg("MALLOC_STATS")
        return try await cmd.query(self)
    }
    /// Returns the allocator statistics.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY MALLOC_STATS](https://redis.io/commands/memory-malloc-stats)
    public func memory_malloc_stats() async throws {
        let cmd = Cmd("MEMORY").arg("MALLOC_STATS")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns details about memory usage.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY STATS](https://redis.io/commands/memory-stats)
    public func memory_stats() -> Self {
        let cmd = Cmd("MEMORY").arg("STATS")
        return self.add_command(cmd)
    }
    /// Asks the allocator to release memory.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY PURGE](https://redis.io/commands/memory-purge)
    public func memory_purge() -> Self {
        let cmd = Cmd("MEMORY").arg("PURGE")
        return self.add_command(cmd)
    }
    /// Outputs a memory problems report.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY DOCTOR](https://redis.io/commands/memory-doctor)
    public func memory_doctor() -> Self {
        let cmd = Cmd("MEMORY").arg("DOCTOR")
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MEMORY HELP](https://redis.io/commands/memory-help)
    public func memory_help() -> Self {
        let cmd = Cmd("MEMORY").arg("HELP")
        return self.add_command(cmd)
    }
    /// Estimates the memory usage of a key.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of samples.
    /// ## Documentation
    /// view the docs for [MEMORY USAGE](https://redis.io/commands/memory-usage)
    public func memory_usage(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("MEMORY").arg("USAGE").arg(key).arg((count != nil) ? "SAMPLES" : nil).arg(count)
        return self.add_command(cmd)
    }
    /// Returns the allocator statistics.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on how much memory is allocated, could be slow
    /// ## Documentation
    /// view the docs for [MEMORY MALLOC_STATS](https://redis.io/commands/memory-malloc-stats)
    public func memory_malloc_stats() -> Self {
        let cmd = Cmd("MEMORY").arg("MALLOC_STATS")
        return self.add_command(cmd)
    }
}
