//
//  xinfo.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns a list of the consumer groups of a stream.
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
    /// Returns a list of the consumer groups of a stream.
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
    /// Returns a list of the consumers in a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.2.0, Added the `inactive` field.
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers<T: FromRedisValue>(_ key: String, _ group: String) async throws -> T {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(group)
        return try await cmd.query(self)
    }
    /// Returns a list of the consumers in a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.2.0, Added the `inactive` field.
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers(_ key: String, _ group: String) async throws {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(group)
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
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
    /// Returns helpful text about the different subcommands.
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
    /// Returns information about a stream.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// - 7.2.0, Added the `active-time` field, and changed the meaning of `seen-time`.
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream<T: FromRedisValue>(_ key: String, _ fullBlock: XinfoStreamFullblock? = nil) async throws
        -> T
    {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg(fullBlock)
        return try await cmd.query(self)
    }
    /// Returns information about a stream.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// - 7.2.0, Added the `active-time` field, and changed the meaning of `seen-time`.
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream(_ key: String, _ fullBlock: XinfoStreamFullblock? = nil) async throws {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg(fullBlock)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns a list of the consumer groups of a stream.
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
    /// Returns a list of the consumers in a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.2.0, Added the `inactive` field.
    /// ## Documentation
    /// view the docs for [XINFO CONSUMERS](https://redis.io/commands/xinfo-consumers)
    public func xinfo_consumers(_ key: String, _ group: String) -> Self {
        let cmd = Cmd("XINFO").arg("CONSUMERS").arg(key).arg(group)
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
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
    /// Returns information about a stream.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, Added the `FULL` modifier.
    /// - 7.0.0, Added the `max-deleted-entry-id`, `entries-added`, `recorded-first-entry-id`, `entries-read` and `lag` fields
    /// - 7.2.0, Added the `active-time` field, and changed the meaning of `seen-time`.
    /// ## Documentation
    /// view the docs for [XINFO STREAM](https://redis.io/commands/xinfo-stream)
    public func xinfo_stream(_ key: String, _ fullBlock: XinfoStreamFullblock? = nil) -> Self {
        let cmd = Cmd("XINFO").arg("STREAM").arg(key).arg(fullBlock)
        return self.add_command(cmd)
    }
}
public struct XinfoStreamFullblock: ToRedisArgs {
    let count: Int?
    let options: Options?
    public init(_ count: Int? = nil, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let FULL = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.FULL) { out.append("FULL".data(using: .utf8)!) }
        }
    }
}
