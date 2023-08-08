//
//  xgroup.swift
//
//
//  Created by Autogen on 19.05.23.
//
import Foundation
extension RedisConnection {
    /// Show helpful text about the different subcommands
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
    /// Show helpful text about the different subcommands
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
    /// Delete a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer<T: FromRedisValue>(_ key: String, _ groupname: String, _ consumername: String)
        async throws -> T
    {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(groupname).arg(consumername)
        return try await cmd.query(self)
    }
    /// Delete a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer(_ key: String, _ groupname: String, _ consumername: String) async throws {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(groupname).arg(consumername)
        try await cmd.exec(self)
    }
    /// Create a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create<T: FromRedisValue>(
        _ key: String, _ groupname: String, _ id: XgroupCreateId, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        return try await cmd.query(self)
    }
    /// Create a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create(
        _ key: String, _ groupname: String, _ id: XgroupCreateId, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) async throws {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        try await cmd.exec(self)
    }
    /// Destroy a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy<T: FromRedisValue>(_ key: String, _ groupname: String) async throws -> T {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(groupname)
        return try await cmd.query(self)
    }
    /// Destroy a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy(_ key: String, _ groupname: String) async throws {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(groupname)
        try await cmd.exec(self)
    }
    /// Set a consumer group to an arbitrary last delivered ID value.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid<T: FromRedisValue>(
        _ key: String, _ groupname: String, _ id: XgroupSetidId, _ entriesRead: Int? = nil
    ) async throws -> T {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead)
        return try await cmd.query(self)
    }
    /// Set a consumer group to an arbitrary last delivered ID value.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid(_ key: String, _ groupname: String, _ id: XgroupSetidId, _ entriesRead: Int? = nil)
        async throws
    {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead)
        try await cmd.exec(self)
    }
    /// Create a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer<T: FromRedisValue>(_ key: String, _ groupname: String, _ consumername: String)
        async throws -> T
    {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(groupname).arg(consumername)
        return try await cmd.query(self)
    }
    /// Create a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer(_ key: String, _ groupname: String, _ consumername: String) async throws {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(groupname).arg(consumername)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Show helpful text about the different subcommands
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
    /// Delete a consumer from a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP DELCONSUMER](https://redis.io/commands/xgroup-delconsumer)
    public func xgroup_delconsumer(_ key: String, _ groupname: String, _ consumername: String) -> Self {
        let cmd = Cmd("XGROUP").arg("DELCONSUMER").arg(key).arg(groupname).arg(consumername)
        return self.add_command(cmd)
    }
    /// Create a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_read` named argument.
    /// ## Documentation
    /// view the docs for [XGROUP CREATE](https://redis.io/commands/xgroup-create)
    public func xgroup_create(
        _ key: String, _ groupname: String, _ id: XgroupCreateId, _ entriesRead: Int? = nil,
        _ options: XgroupCreateOptions? = nil
    ) -> Self {
        let cmd = Cmd("XGROUP").arg("CREATE").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead).arg(options)
        return self.add_command(cmd)
    }
    /// Destroy a consumer group.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of entries in the group's pending entries list (PEL).
    /// ## Documentation
    /// view the docs for [XGROUP DESTROY](https://redis.io/commands/xgroup-destroy)
    public func xgroup_destroy(_ key: String, _ groupname: String) -> Self {
        let cmd = Cmd("XGROUP").arg("DESTROY").arg(key).arg(groupname)
        return self.add_command(cmd)
    }
    /// Set a consumer group to an arbitrary last delivered ID value.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the optional `entries_read` argument.
    /// ## Documentation
    /// view the docs for [XGROUP SETID](https://redis.io/commands/xgroup-setid)
    public func xgroup_setid(_ key: String, _ groupname: String, _ id: XgroupSetidId, _ entriesRead: Int? = nil) -> Self
    {
        let cmd = Cmd("XGROUP").arg("SETID").arg(key).arg(groupname).arg(id).arg(
            (entriesRead != nil) ? "ENTRIESREAD" : nil
        ).arg(entriesRead)
        return self.add_command(cmd)
    }
    /// Create a consumer in a consumer group.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XGROUP CREATECONSUMER](https://redis.io/commands/xgroup-createconsumer)
    public func xgroup_createconsumer(_ key: String, _ groupname: String, _ consumername: String) -> Self {
        let cmd = Cmd("XGROUP").arg("CREATECONSUMER").arg(key).arg(groupname).arg(consumername)
        return self.add_command(cmd)
    }
}
public enum XgroupCreateId: ToRedisArgs {
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
public enum XgroupSetidId: ToRedisArgs {
    case ID(String)
    case NEW_ID
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ID(let string): string.write_redis_args(out: &out)
        case .NEW_ID: out.append("$".data(using: .utf8)!)
        }
    }
}
