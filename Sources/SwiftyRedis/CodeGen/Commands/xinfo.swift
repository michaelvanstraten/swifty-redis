//
//  xinfo.swift
//
//
//  Created by CodeGen on 08.09.23.
//
import Foundation
extension RedisConnection {
    /// List the consumer groups of a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO GROUPS](https://redis.io/commands/xinfo-groups)
    public func xinfo_groups<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("XINFO").arg("GROUPS").arg(key)
        return try await cmd.query(self)
    }
    /// List the consumer groups of a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO GROUPS](https://redis.io/commands/xinfo-groups)
    public func xinfo_groups(_ key: String) async throws {
        let cmd = Cmd("XINFO").arg("GROUPS").arg(key)
        try await cmd.exec(self)
    }
    /// List the consumers in a consumer group
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers<T: FromRedisValue>(_ key: String, _ groupname: String) async throws -> T {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(groupname)
        return try await cmd.query(self)
    }
    /// List the consumers in a consumer group
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers(_ key: String, _ groupname: String) async throws {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(groupname)
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO HELP](https://redis.io/commands/xinfo-help)
    public func xinfo_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("XINFO").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO HELP](https://redis.io/commands/xinfo-help)
    public func xinfo_help() async throws {
        let cmd = Cmd("XINFO").arg("HELP")
        try await cmd.exec(self)
    }
    /// Get information about a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream<T: FromRedisValue>(_ key: String, _ full: XinfoStreamFull? = nil) async throws -> T {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg((full != nil) ? "FULL" : nil).arg(full)
        return try await cmd.query(self)
    }
    /// Get information about a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream(_ key: String, _ full: XinfoStreamFull? = nil) async throws {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg((full != nil) ? "FULL" : nil).arg(full)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// List the consumer groups of a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO GROUPS](https://redis.io/commands/xinfo-groups)
    public func xinfo_groups(_ key: String) -> Self {
        let cmd = Cmd("XINFO").arg("GROUPS").arg(key)
        return self.add_command(cmd)
    }
    /// List the consumers in a consumer group
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers(_ key: String, _ groupname: String) -> Self {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(groupname)
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XINFO HELP](https://redis.io/commands/xinfo-help)
    public func xinfo_help() -> Self {
        let cmd = Cmd("XINFO").arg("HELP")
        return self.add_command(cmd)
    }
    /// Get information about a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream(_ key: String, _ full: XinfoStreamFull? = nil) -> Self {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg((full != nil) ? "FULL" : nil).arg(full)
        return self.add_command(cmd)
    }
}
public struct XinfoStreamFull: ToRedisArgs {
    let count: Int?
    public init(_ count: Int? = nil) { self.count = count }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
    }
}
