//
//  slowlog.swift
//
//
//  Created by CodeGen on 08.09.23.
//
import Foundation
extension RedisConnection {
    /// Clear all entries from the slow log
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries in the slowlog
    /// ## Documentation
    /// view the docs for [SLOWLOG RESET](https://redis.io/commands/slowlog-reset)
    public func slowlog_reset<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SLOWLOG").arg("RESET")
        return try await cmd.query(self)
    }
    /// Clear all entries from the slow log
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries in the slowlog
    /// ## Documentation
    /// view the docs for [SLOWLOG RESET](https://redis.io/commands/slowlog-reset)
    public func slowlog_reset() async throws {
        let cmd = Cmd("SLOWLOG").arg("RESET")
        try await cmd.exec(self)
    }
    /// Get the slow log's entries
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries returned
    /// ## History
    /// - 4.0.0, Added client IP address, port and name to the reply.
    /// ## Documentation
    /// view the docs for [SLOWLOG GET](https://redis.io/commands/slowlog-get)
    public func slowlog_get<T: FromRedisValue>(_ count: Int? = nil) async throws -> T {
        let cmd = Cmd("SLOWLOG").arg("GET").arg(count)
        return try await cmd.query(self)
    }
    /// Get the slow log's entries
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries returned
    /// ## History
    /// - 4.0.0, Added client IP address, port and name to the reply.
    /// ## Documentation
    /// view the docs for [SLOWLOG GET](https://redis.io/commands/slowlog-get)
    public func slowlog_get(_ count: Int? = nil) async throws {
        let cmd = Cmd("SLOWLOG").arg("GET").arg(count)
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG HELP](https://redis.io/commands/slowlog-help)
    public func slowlog_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SLOWLOG").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG HELP](https://redis.io/commands/slowlog-help)
    public func slowlog_help() async throws {
        let cmd = Cmd("SLOWLOG").arg("HELP")
        try await cmd.exec(self)
    }
    /// Get the slow log's length
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG LEN](https://redis.io/commands/slowlog-len)
    public func slowlog_len<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SLOWLOG").arg("LEN")
        return try await cmd.query(self)
    }
    /// Get the slow log's length
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG LEN](https://redis.io/commands/slowlog-len)
    public func slowlog_len() async throws {
        let cmd = Cmd("SLOWLOG").arg("LEN")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Clear all entries from the slow log
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries in the slowlog
    /// ## Documentation
    /// view the docs for [SLOWLOG RESET](https://redis.io/commands/slowlog-reset)
    public func slowlog_reset() -> Self {
        let cmd = Cmd("SLOWLOG").arg("RESET")
        return self.add_command(cmd)
    }
    /// Get the slow log's entries
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(N) where N is the number of entries returned
    /// ## History
    /// - 4.0.0, Added client IP address, port and name to the reply.
    /// ## Documentation
    /// view the docs for [SLOWLOG GET](https://redis.io/commands/slowlog-get)
    public func slowlog_get(_ count: Int? = nil) -> Self {
        let cmd = Cmd("SLOWLOG").arg("GET").arg(count)
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG HELP](https://redis.io/commands/slowlog-help)
    public func slowlog_help() -> Self {
        let cmd = Cmd("SLOWLOG").arg("HELP")
        return self.add_command(cmd)
    }
    /// Get the slow log's length
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLOWLOG LEN](https://redis.io/commands/slowlog-len)
    public func slowlog_len() -> Self {
        let cmd = Cmd("SLOWLOG").arg("LEN")
        return self.add_command(cmd)
    }
}
