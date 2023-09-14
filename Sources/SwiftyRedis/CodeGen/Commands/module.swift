//
//  module.swift
//
//
//  Created by CodeGen on 14.09.23.
//
import Foundation
extension RedisConnection {
    /// Unload a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE UNLOAD](https://redis.io/commands/module-unload)
    public func module_unload<T: FromRedisValue>(_ name: String) async throws -> T {
        let cmd = Cmd("MODULE").arg("UNLOAD").arg(name)
        return try await cmd.query(self)
    }
    /// Unload a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE UNLOAD](https://redis.io/commands/module-unload)
    public func module_unload(_ name: String) async throws {
        let cmd = Cmd("MODULE").arg("UNLOAD").arg(name)
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE HELP](https://redis.io/commands/module-help)
    public func module_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MODULE").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE HELP](https://redis.io/commands/module-help)
    public func module_help() async throws {
        let cmd = Cmd("MODULE").arg("HELP")
        try await cmd.exec(self)
    }
    /// Load a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOAD](https://redis.io/commands/module-load)
    public func module_load<T: FromRedisValue>(_ path: String, _ arg: String...) async throws -> T {
        let cmd = Cmd("MODULE").arg("LOAD").arg(path).arg(arg)
        return try await cmd.query(self)
    }
    /// Load a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOAD](https://redis.io/commands/module-load)
    public func module_load(_ path: String, _ arg: String...) async throws {
        let cmd = Cmd("MODULE").arg("LOAD").arg(path).arg(arg)
        try await cmd.exec(self)
    }
    /// Load a module with extended parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOADEX](https://redis.io/commands/module-loadex)
    public func module_loadex<T: FromRedisValue>(
        _ path: String, _ configs: ModuleLoadexConfigs..., args: ModuleLoadexArgs...
    ) async throws -> T {
        let cmd = Cmd("MODULE").arg("LOADEX").arg(path).arg((!configs.isEmpty) ? "CONFIG" : nil).arg(configs).arg(
            (!args.isEmpty) ? "ARGS" : nil
        ).arg(args)
        return try await cmd.query(self)
    }
    /// Load a module with extended parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOADEX](https://redis.io/commands/module-loadex)
    public func module_loadex(_ path: String, _ configs: ModuleLoadexConfigs..., args: ModuleLoadexArgs...) async throws
    {
        let cmd = Cmd("MODULE").arg("LOADEX").arg(path).arg((!configs.isEmpty) ? "CONFIG" : nil).arg(configs).arg(
            (!args.isEmpty) ? "ARGS" : nil
        ).arg(args)
        try await cmd.exec(self)
    }
    /// List all modules loaded by the server
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of loaded modules.
    /// ## Documentation
    /// view the docs for [MODULE LIST](https://redis.io/commands/module-list)
    public func module_list<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MODULE").arg("LIST")
        return try await cmd.query(self)
    }
    /// List all modules loaded by the server
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of loaded modules.
    /// ## Documentation
    /// view the docs for [MODULE LIST](https://redis.io/commands/module-list)
    public func module_list() async throws {
        let cmd = Cmd("MODULE").arg("LIST")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Unload a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE UNLOAD](https://redis.io/commands/module-unload)
    public func module_unload(_ name: String) -> Self {
        let cmd = Cmd("MODULE").arg("UNLOAD").arg(name)
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE HELP](https://redis.io/commands/module-help)
    public func module_help() -> Self {
        let cmd = Cmd("MODULE").arg("HELP")
        return self.add_command(cmd)
    }
    /// Load a module
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOAD](https://redis.io/commands/module-load)
    public func module_load(_ path: String, _ arg: String...) -> Self {
        let cmd = Cmd("MODULE").arg("LOAD").arg(path).arg(arg)
        return self.add_command(cmd)
    }
    /// Load a module with extended parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MODULE LOADEX](https://redis.io/commands/module-loadex)
    public func module_loadex(_ path: String, _ configs: ModuleLoadexConfigs..., args: ModuleLoadexArgs...) -> Self {
        let cmd = Cmd("MODULE").arg("LOADEX").arg(path).arg((!configs.isEmpty) ? "CONFIG" : nil).arg(configs).arg(
            (!args.isEmpty) ? "ARGS" : nil
        ).arg(args)
        return self.add_command(cmd)
    }
    /// List all modules loaded by the server
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the number of loaded modules.
    /// ## Documentation
    /// view the docs for [MODULE LIST](https://redis.io/commands/module-list)
    public func module_list() -> Self {
        let cmd = Cmd("MODULE").arg("LIST")
        return self.add_command(cmd)
    }
}
public struct ModuleLoadexConfigs: ToRedisArgs {
    let name: String
    let value: String
    public init(_ name: String, _ value: String) {
        self.name = name
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        name.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public struct ModuleLoadexArgs: ToRedisArgs {
    let arg: String
    public init(_ arg: String) { self.arg = arg }
    public func write_redis_args(out: inout [Data]) { arg.write_redis_args(out: &out) }
}
