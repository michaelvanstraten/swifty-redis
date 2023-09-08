//
//  script.swift
//
//
//  Created by CodeGen on 08.09.23.
//
import Foundation
extension RedisConnection {
    /// Kill the script currently in execution.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT KILL](https://redis.io/commands/script-kill)
    public func script_kill<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SCRIPT").arg("KILL")
        return try await cmd.query(self)
    }
    /// Kill the script currently in execution.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT KILL](https://redis.io/commands/script-kill)
    public func script_kill() async throws {
        let cmd = Cmd("SCRIPT").arg("KILL")
        try await cmd.exec(self)
    }
    /// Remove all the scripts from the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts in cache
    /// ## History
    /// - 6.2.0, Added the `ASYNC` and `SYNC` flushing mode modifiers.
    /// ## Documentation
    /// view the docs for [SCRIPT FLUSH](https://redis.io/commands/script-flush)
    public func script_flush<T: FromRedisValue>(_ async: ScriptFlushAsync? = nil) async throws -> T {
        let cmd = Cmd("SCRIPT").arg("FLUSH").arg(async)
        return try await cmd.query(self)
    }
    /// Remove all the scripts from the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts in cache
    /// ## History
    /// - 6.2.0, Added the `ASYNC` and `SYNC` flushing mode modifiers.
    /// ## Documentation
    /// view the docs for [SCRIPT FLUSH](https://redis.io/commands/script-flush)
    public func script_flush(_ async: ScriptFlushAsync? = nil) async throws {
        let cmd = Cmd("SCRIPT").arg("FLUSH").arg(async)
        try await cmd.exec(self)
    }
    /// Load the specified Lua script into the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the length in bytes of the script body.
    /// ## Documentation
    /// view the docs for [SCRIPT LOAD](https://redis.io/commands/script-load)
    public func script_load<T: FromRedisValue>(_ script: String) async throws -> T {
        let cmd = Cmd("SCRIPT").arg("LOAD").arg(script)
        return try await cmd.query(self)
    }
    /// Load the specified Lua script into the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the length in bytes of the script body.
    /// ## Documentation
    /// view the docs for [SCRIPT LOAD](https://redis.io/commands/script-load)
    public func script_load(_ script: String) async throws {
        let cmd = Cmd("SCRIPT").arg("LOAD").arg(script)
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT HELP](https://redis.io/commands/script-help)
    public func script_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SCRIPT").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT HELP](https://redis.io/commands/script-help)
    public func script_help() async throws {
        let cmd = Cmd("SCRIPT").arg("HELP")
        try await cmd.exec(self)
    }
    /// Set the debug mode for executed scripts.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT DEBUG](https://redis.io/commands/script-debug)
    public func script_debug<T: FromRedisValue>(_ mode: ScriptDebugMode) async throws -> T {
        let cmd = Cmd("SCRIPT").arg("DEBUG").arg(mode)
        return try await cmd.query(self)
    }
    /// Set the debug mode for executed scripts.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT DEBUG](https://redis.io/commands/script-debug)
    public func script_debug(_ mode: ScriptDebugMode) async throws {
        let cmd = Cmd("SCRIPT").arg("DEBUG").arg(mode)
        try await cmd.exec(self)
    }
    /// Check existence of scripts in the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts to check (so checking a single script is an O(1) operation).
    /// ## Documentation
    /// view the docs for [SCRIPT EXISTS](https://redis.io/commands/script-exists)
    public func script_exists<T: FromRedisValue>(_ sha1: String...) async throws -> T {
        let cmd = Cmd("SCRIPT").arg("EXISTS").arg(sha1)
        return try await cmd.query(self)
    }
    /// Check existence of scripts in the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts to check (so checking a single script is an O(1) operation).
    /// ## Documentation
    /// view the docs for [SCRIPT EXISTS](https://redis.io/commands/script-exists)
    public func script_exists(_ sha1: String...) async throws {
        let cmd = Cmd("SCRIPT").arg("EXISTS").arg(sha1)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Kill the script currently in execution.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT KILL](https://redis.io/commands/script-kill)
    public func script_kill() -> Self {
        let cmd = Cmd("SCRIPT").arg("KILL")
        return self.add_command(cmd)
    }
    /// Remove all the scripts from the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts in cache
    /// ## History
    /// - 6.2.0, Added the `ASYNC` and `SYNC` flushing mode modifiers.
    /// ## Documentation
    /// view the docs for [SCRIPT FLUSH](https://redis.io/commands/script-flush)
    public func script_flush(_ async: ScriptFlushAsync? = nil) -> Self {
        let cmd = Cmd("SCRIPT").arg("FLUSH").arg(async)
        return self.add_command(cmd)
    }
    /// Load the specified Lua script into the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the length in bytes of the script body.
    /// ## Documentation
    /// view the docs for [SCRIPT LOAD](https://redis.io/commands/script-load)
    public func script_load(_ script: String) -> Self {
        let cmd = Cmd("SCRIPT").arg("LOAD").arg(script)
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT HELP](https://redis.io/commands/script-help)
    public func script_help() -> Self {
        let cmd = Cmd("SCRIPT").arg("HELP")
        return self.add_command(cmd)
    }
    /// Set the debug mode for executed scripts.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCRIPT DEBUG](https://redis.io/commands/script-debug)
    public func script_debug(_ mode: ScriptDebugMode) -> Self {
        let cmd = Cmd("SCRIPT").arg("DEBUG").arg(mode)
        return self.add_command(cmd)
    }
    /// Check existence of scripts in the script cache.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N) with N being the number of scripts to check (so checking a single script is an O(1) operation).
    /// ## Documentation
    /// view the docs for [SCRIPT EXISTS](https://redis.io/commands/script-exists)
    public func script_exists(_ sha1: String...) -> Self {
        let cmd = Cmd("SCRIPT").arg("EXISTS").arg(sha1)
        return self.add_command(cmd)
    }
}
public enum ScriptFlushAsync: ToRedisArgs {
    case ASYNC
    case SYNC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASYNC: out.append("ASYNC".data(using: .utf8)!)
        case .SYNC: out.append("SYNC".data(using: .utf8)!)
        }
    }
}
public enum ScriptDebugMode: ToRedisArgs {
    case YES
    case SYNC
    case NO
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .YES: out.append("YES".data(using: .utf8)!)
        case .SYNC: out.append("SYNC".data(using: .utf8)!)
        case .NO: out.append("NO".data(using: .utf8)!)
        }
    }
}
