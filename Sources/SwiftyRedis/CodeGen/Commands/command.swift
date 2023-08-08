//
//  command.swift
//
//
//  Created by Autogen on 19.05.23.
//
import Foundation
extension RedisConnection {
    /// Extract keys and access flags given a full Redis command
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS")
        return try await cmd.query(self)
    }
    /// Extract keys and access flags given a full Redis command
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags() async throws {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS")
        try await cmd.exec(self)
    }
    /// Get array of specific Redis command documentation
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## Documentation
    /// view the docs for [COMMAND DOCS](https://redis.io/commands/command-docs)
    public func command_docs<T: FromRedisValue>(_ commandName: String...) async throws -> T {
        let cmd = Cmd("COMMAND").arg("DOCS").arg(commandName)
        return try await cmd.query(self)
    }
    /// Get array of specific Redis command documentation
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## Documentation
    /// view the docs for [COMMAND DOCS](https://redis.io/commands/command-docs)
    public func command_docs(_ commandName: String...) async throws {
        let cmd = Cmd("COMMAND").arg("DOCS").arg(commandName)
        try await cmd.exec(self)
    }
    /// Get total number of Redis commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND COUNT](https://redis.io/commands/command-count)
    public func command_count<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("COMMAND").arg("COUNT")
        return try await cmd.query(self)
    }
    /// Get total number of Redis commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND COUNT](https://redis.io/commands/command-count)
    public func command_count() async throws {
        let cmd = Cmd("COMMAND").arg("COUNT")
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND HELP](https://redis.io/commands/command-help)
    public func command_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("COMMAND").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND HELP](https://redis.io/commands/command-help)
    public func command_help() async throws {
        let cmd = Cmd("COMMAND").arg("HELP")
        try await cmd.exec(self)
    }
    /// Extract keys given a full Redis command
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("COMMAND").arg("GETKEYS")
        return try await cmd.query(self)
    }
    /// Extract keys given a full Redis command
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys() async throws {
        let cmd = Cmd("COMMAND").arg("GETKEYS")
        try await cmd.exec(self)
    }
    /// Get array of specific Redis command details, or all when no argument is given.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## History
    /// - 7.0.0, Allowed to be called with no argument to get info on all commands.
    /// ## Documentation
    /// view the docs for [COMMAND INFO](https://redis.io/commands/command-info)
    public func command_info<T: FromRedisValue>(_ commandName: String...) async throws -> T {
        let cmd = Cmd("COMMAND").arg("INFO").arg(commandName)
        return try await cmd.query(self)
    }
    /// Get array of specific Redis command details, or all when no argument is given.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## History
    /// - 7.0.0, Allowed to be called with no argument to get info on all commands.
    /// ## Documentation
    /// view the docs for [COMMAND INFO](https://redis.io/commands/command-info)
    public func command_info(_ commandName: String...) async throws {
        let cmd = Cmd("COMMAND").arg("INFO").arg(commandName)
        try await cmd.exec(self)
    }
    /// Get an array of Redis command names
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND LIST](https://redis.io/commands/command-list)
    public func command_list<T: FromRedisValue>(_ filterby: CommandListFilterby? = nil) async throws -> T {
        let cmd = Cmd("COMMAND").arg("LIST").arg((filterby != nil) ? "FILTERBY" : nil).arg(filterby)
        return try await cmd.query(self)
    }
    /// Get an array of Redis command names
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND LIST](https://redis.io/commands/command-list)
    public func command_list(_ filterby: CommandListFilterby? = nil) async throws {
        let cmd = Cmd("COMMAND").arg("LIST").arg((filterby != nil) ? "FILTERBY" : nil).arg(filterby)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Extract keys and access flags given a full Redis command
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags() -> Self {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS")
        return self.add_command(cmd)
    }
    /// Get array of specific Redis command documentation
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## Documentation
    /// view the docs for [COMMAND DOCS](https://redis.io/commands/command-docs)
    public func command_docs(_ commandName: String...) -> Self {
        let cmd = Cmd("COMMAND").arg("DOCS").arg(commandName)
        return self.add_command(cmd)
    }
    /// Get total number of Redis commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND COUNT](https://redis.io/commands/command-count)
    public func command_count() -> Self {
        let cmd = Cmd("COMMAND").arg("COUNT")
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [COMMAND HELP](https://redis.io/commands/command-help)
    public func command_help() -> Self {
        let cmd = Cmd("COMMAND").arg("HELP")
        return self.add_command(cmd)
    }
    /// Extract keys given a full Redis command
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys() -> Self {
        let cmd = Cmd("COMMAND").arg("GETKEYS")
        return self.add_command(cmd)
    }
    /// Get array of specific Redis command details, or all when no argument is given.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of commands to look up
    /// ## History
    /// - 7.0.0, Allowed to be called with no argument to get info on all commands.
    /// ## Documentation
    /// view the docs for [COMMAND INFO](https://redis.io/commands/command-info)
    public func command_info(_ commandName: String...) -> Self {
        let cmd = Cmd("COMMAND").arg("INFO").arg(commandName)
        return self.add_command(cmd)
    }
    /// Get an array of Redis command names
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND LIST](https://redis.io/commands/command-list)
    public func command_list(_ filterby: CommandListFilterby? = nil) -> Self {
        let cmd = Cmd("COMMAND").arg("LIST").arg((filterby != nil) ? "FILTERBY" : nil).arg(filterby)
        return self.add_command(cmd)
    }
}
public enum CommandListFilterby: ToRedisArgs {
    case MODULE(String)
    case ACLCAT(String)
    case PATTERN(String)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .MODULE(let string):
            out.append("MODULE".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        case .ACLCAT(let string):
            out.append("ACLCAT".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        case .PATTERN(let string):
            out.append("PATTERN".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        }
    }
}
