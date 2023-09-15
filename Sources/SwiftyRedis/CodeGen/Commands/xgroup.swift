//
//  xgroup.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP HELP](https://redis.io/commands/xgroup-help)
    public func xgroup_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("XGROUP").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP HELP](https://redis.io/commands/xgroup-help)
    public func xgroup_help() async throws {
        let cmd = Cmd("XGROUP").arg("HELP")
        try await cmd.exec(self)
    }
    /// Deletes a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer<T: FromRedisValue>(_ key: String, _ group: String, _ consumer: String) async throws
        -> T
    {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(group).arg(consumer)
        return try await cmd.query(self)
    }
    /// Deletes a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer(_ key: String, _ group: String, _ consumer: String) async throws {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(group).arg(consumer)
        try await cmd.exec(self)
    }
    /// Creates a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create<T: FromRedisValue>(
        _ key: String, _ group: String, _ idSelector: XgroupCreateIdselector, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(group).arg(idSelector).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        return try await cmd.query(self)
    }
    /// Creates a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create(
        _ key: String, _ group: String, _ idSelector: XgroupCreateIdselector, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) async throws {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(group).arg(idSelector).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        try await cmd.exec(self)
    }
    /// Destroys a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy<T: FromRedisValue>(_ key: String, _ group: String) async throws -> T {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(group)
        return try await cmd.query(self)
    }
    /// Destroys a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy(_ key: String, _ group: String) async throws {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(group)
        try await cmd.exec(self)
    }
    /// Sets the last-delivered ID of a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid<T: FromRedisValue>(
        _ key: String, _ group: String, _ idSelector: XgroupSetidIdselector, _ entriesread: Int? = nil
    ) async throws -> T {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(group).arg(idSelector).arg(
            (entriesread != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesread)
        return try await cmd.query(self)
    }
    /// Sets the last-delivered ID of a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid(
        _ key: String, _ group: String, _ idSelector: XgroupSetidIdselector, _ entriesread: Int? = nil
    ) async throws {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(group).arg(idSelector).arg(
            (entriesread != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesread)
        try await cmd.exec(self)
    }
    /// Creates a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer<T: FromRedisValue>(_ key: String, _ group: String, _ consumer: String)
        async throws -> T
    {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(group).arg(consumer)
        return try await cmd.query(self)
    }
    /// Creates a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer(_ key: String, _ group: String, _ consumer: String) async throws {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(group).arg(consumer)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP HELP](https://redis.io/commands/xgroup-help)
    public func xgroup_help() -> Self {
        let cmd = Cmd("XGROUP").arg("HELP")
        return self.add_command(cmd)
    }
    /// Deletes a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer(_ key: String, _ group: String, _ consumer: String) -> Self {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(group).arg(consumer)
        return self.add_command(cmd)
    }
    /// Creates a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create(
        _ key: String, _ group: String, _ idSelector: XgroupCreateIdselector, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) -> Self {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(group).arg(idSelector).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        return self.add_command(cmd)
    }
    /// Destroys a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy(_ key: String, _ group: String) -> Self {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(group)
        return self.add_command(cmd)
    }
    /// Sets the last-delivered ID of a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid(
        _ key: String, _ group: String, _ idSelector: XgroupSetidIdselector, _ entriesread: Int? = nil
    ) -> Self {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(group).arg(idSelector).arg(
            (entriesread != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesread)
        return self.add_command(cmd)
    }
    /// Creates a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer(_ key: String, _ group: String, _ consumer: String) -> Self {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(group).arg(consumer)
        return self.add_command(cmd)
    }
}
public enum XgroupCreateIdselector: ToRedisArgs {
    case ID(String)
    case NEW_ID
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ID(let string): string.write_redis_args(out: &out)
        case .NEW_ID: out.append("$".data(using: .utf8)!)
        }
    }
}
public struct XgroupCreateOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let MKSTREAM = XgroupCreateOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.MKSTREAM) { out.append("MKSTREAM".data(using: .utf8)!) }
    }
}
public enum XgroupSetidIdselector: ToRedisArgs {
    case ID(String)
    case NEW_ID
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ID(let string): string.write_redis_args(out: &out)
        case .NEW_ID: out.append("$".data(using: .utf8)!)
        }
    }
}
