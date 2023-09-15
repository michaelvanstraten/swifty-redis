//
//  function.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Deletes all libraries and functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions deleted
    /// ## Documentation
    /// view the docs for [FUNCTION FLUSH](https://redis.io/commands/function-flush)
    public func function_flush<T: FromRedisValue>(_ flushType: FunctionFlushFlushtype? = nil) async throws -> T {
        let cmd = Cmd("FUNCTION").arg("FLUSH").arg(flushType)
        return try await cmd.query(self)
    }
    /// Deletes all libraries and functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions deleted
    /// ## Documentation
    /// view the docs for [FUNCTION FLUSH](https://redis.io/commands/function-flush)
    public func function_flush(_ flushType: FunctionFlushFlushtype? = nil) async throws {
        let cmd = Cmd("FUNCTION").arg("FLUSH").arg(flushType)
        try await cmd.exec(self)
    }
    /// Returns information about all libraries.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION LIST](https://redis.io/commands/function-list)
    public func function_list<T: FromRedisValue>(
        _ libraryNamePattern: String? = nil, _ options: FunctionListOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("FUNCTION").arg("LIST").arg((libraryNamePattern != nil) ? "LIBRARYNAME" : nil).arg(
            libraryNamePattern
        ).arg(options)
        return try await cmd.query(self)
    }
    /// Returns information about all libraries.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION LIST](https://redis.io/commands/function-list)
    public func function_list(_ libraryNamePattern: String? = nil, _ options: FunctionListOptions? = nil) async throws {
        let cmd = Cmd("FUNCTION").arg("LIST").arg((libraryNamePattern != nil) ? "LIBRARYNAME" : nil).arg(
            libraryNamePattern
        ).arg(options)
        try await cmd.exec(self)
    }
    /// Deletes a library and its functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION DELETE](https://redis.io/commands/function-delete)
    public func function_delete<T: FromRedisValue>(_ libraryName: String) async throws -> T {
        let cmd = Cmd("FUNCTION").arg("DELETE").arg(libraryName)
        return try await cmd.query(self)
    }
    /// Deletes a library and its functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION DELETE](https://redis.io/commands/function-delete)
    public func function_delete(_ libraryName: String) async throws {
        let cmd = Cmd("FUNCTION").arg("DELETE").arg(libraryName)
        try await cmd.exec(self)
    }
    /// Returns information about a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION STATS](https://redis.io/commands/function-stats)
    public func function_stats<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("FUNCTION").arg("STATS")
        return try await cmd.query(self)
    }
    /// Returns information about a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION STATS](https://redis.io/commands/function-stats)
    public func function_stats() async throws {
        let cmd = Cmd("FUNCTION").arg("STATS")
        try await cmd.exec(self)
    }
    /// Restores all libraries from a payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions on the payload
    /// ## Documentation
    /// view the docs for [FUNCTION RESTORE](https://redis.io/commands/function-restore)
    public func function_restore<T: FromRedisValue>(_ serializedValue: String, _ policy: FunctionRestorePolicy? = nil)
        async throws -> T
    {
        let cmd = Cmd("FUNCTION").arg("RESTORE").arg(serializedValue).arg(policy)
        return try await cmd.query(self)
    }
    /// Restores all libraries from a payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions on the payload
    /// ## Documentation
    /// view the docs for [FUNCTION RESTORE](https://redis.io/commands/function-restore)
    public func function_restore(_ serializedValue: String, _ policy: FunctionRestorePolicy? = nil) async throws {
        let cmd = Cmd("FUNCTION").arg("RESTORE").arg(serializedValue).arg(policy)
        try await cmd.exec(self)
    }
    /// Creates a library.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1) (considering compilation time is redundant)
    /// ## Documentation
    /// view the docs for [FUNCTION LOAD](https://redis.io/commands/function-load)
    public func function_load<T: FromRedisValue>(_ functionCode: String, _ options: FunctionLoadOptions? = nil)
        async throws -> T
    {
        let cmd = Cmd("FUNCTION").arg("LOAD").arg(functionCode).arg(options)
        return try await cmd.query(self)
    }
    /// Creates a library.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1) (considering compilation time is redundant)
    /// ## Documentation
    /// view the docs for [FUNCTION LOAD](https://redis.io/commands/function-load)
    public func function_load(_ functionCode: String, _ options: FunctionLoadOptions? = nil) async throws {
        let cmd = Cmd("FUNCTION").arg("LOAD").arg(functionCode).arg(options)
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION HELP](https://redis.io/commands/function-help)
    public func function_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("FUNCTION").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION HELP](https://redis.io/commands/function-help)
    public func function_help() async throws {
        let cmd = Cmd("FUNCTION").arg("HELP")
        try await cmd.exec(self)
    }
    /// Terminates a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION KILL](https://redis.io/commands/function-kill)
    public func function_kill<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("FUNCTION").arg("KILL")
        return try await cmd.query(self)
    }
    /// Terminates a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION KILL](https://redis.io/commands/function-kill)
    public func function_kill() async throws {
        let cmd = Cmd("FUNCTION").arg("KILL")
        try await cmd.exec(self)
    }
    /// Dumps all libraries into a serialized binary payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION DUMP](https://redis.io/commands/function-dump)
    public func function_dump<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("FUNCTION").arg("DUMP")
        return try await cmd.query(self)
    }
    /// Dumps all libraries into a serialized binary payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION DUMP](https://redis.io/commands/function-dump)
    public func function_dump() async throws {
        let cmd = Cmd("FUNCTION").arg("DUMP")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Deletes all libraries and functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions deleted
    /// ## Documentation
    /// view the docs for [FUNCTION FLUSH](https://redis.io/commands/function-flush)
    public func function_flush(_ flushType: FunctionFlushFlushtype? = nil) -> Self {
        let cmd = Cmd("FUNCTION").arg("FLUSH").arg(flushType)
        return self.add_command(cmd)
    }
    /// Returns information about all libraries.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION LIST](https://redis.io/commands/function-list)
    public func function_list(_ libraryNamePattern: String? = nil, _ options: FunctionListOptions? = nil) -> Self {
        let cmd = Cmd("FUNCTION").arg("LIST").arg((libraryNamePattern != nil) ? "LIBRARYNAME" : nil).arg(
            libraryNamePattern
        ).arg(options)
        return self.add_command(cmd)
    }
    /// Deletes a library and its functions.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION DELETE](https://redis.io/commands/function-delete)
    public func function_delete(_ libraryName: String) -> Self {
        let cmd = Cmd("FUNCTION").arg("DELETE").arg(libraryName)
        return self.add_command(cmd)
    }
    /// Returns information about a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION STATS](https://redis.io/commands/function-stats)
    public func function_stats() -> Self {
        let cmd = Cmd("FUNCTION").arg("STATS")
        return self.add_command(cmd)
    }
    /// Restores all libraries from a payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions on the payload
    /// ## Documentation
    /// view the docs for [FUNCTION RESTORE](https://redis.io/commands/function-restore)
    public func function_restore(_ serializedValue: String, _ policy: FunctionRestorePolicy? = nil) -> Self {
        let cmd = Cmd("FUNCTION").arg("RESTORE").arg(serializedValue).arg(policy)
        return self.add_command(cmd)
    }
    /// Creates a library.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1) (considering compilation time is redundant)
    /// ## Documentation
    /// view the docs for [FUNCTION LOAD](https://redis.io/commands/function-load)
    public func function_load(_ functionCode: String, _ options: FunctionLoadOptions? = nil) -> Self {
        let cmd = Cmd("FUNCTION").arg("LOAD").arg(functionCode).arg(options)
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION HELP](https://redis.io/commands/function-help)
    public func function_help() -> Self {
        let cmd = Cmd("FUNCTION").arg("HELP")
        return self.add_command(cmd)
    }
    /// Terminates a function during execution.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FUNCTION KILL](https://redis.io/commands/function-kill)
    public func function_kill() -> Self {
        let cmd = Cmd("FUNCTION").arg("KILL")
        return self.add_command(cmd)
    }
    /// Dumps all libraries into a serialized binary payload.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of functions
    /// ## Documentation
    /// view the docs for [FUNCTION DUMP](https://redis.io/commands/function-dump)
    public func function_dump() -> Self {
        let cmd = Cmd("FUNCTION").arg("DUMP")
        return self.add_command(cmd)
    }
}
public enum FunctionFlushFlushtype: ToRedisArgs {
    case ASYNC
    case SYNC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASYNC: out.append("ASYNC".data(using: .utf8)!)
        case .SYNC: out.append("SYNC".data(using: .utf8)!)
        }
    }
}
public struct FunctionListOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCODE = FunctionListOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCODE) { out.append("WITHCODE".data(using: .utf8)!) }
    }
}
public enum FunctionRestorePolicy: ToRedisArgs {
    case FLUSH
    case APPEND
    case REPLACE
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .FLUSH: out.append("FLUSH".data(using: .utf8)!)
        case .APPEND: out.append("APPEND".data(using: .utf8)!)
        case .REPLACE: out.append("REPLACE".data(using: .utf8)!)
        }
    }
}
public struct FunctionLoadOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REPLACE = FunctionLoadOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.REPLACE) { out.append("REPLACE".data(using: .utf8)!) }
    }
}
