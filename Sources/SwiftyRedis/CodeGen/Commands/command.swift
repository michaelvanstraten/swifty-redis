//
//  command.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Extracts the key names and access flags for an arbitrary command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags<T: FromRedisValue>(_ command: String, _ arg: String...) async throws -> T {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS").arg(command).arg(arg)
        return try await cmd.query(self)
    }
    /// Extracts the key names and access flags for an arbitrary command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags(_ command: String, _ arg: String...) async throws {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS").arg(command).arg(arg)
        try await cmd.exec(self)
    }
    /// Returns documentary information about one, multiple or all commands.
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
    /// Returns documentary information about one, multiple or all commands.
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
    /// Returns a count of commands.
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
    /// Returns a count of commands.
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
    /// Returns helpful text about the different subcommands.
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
    /// Returns helpful text about the different subcommands.
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
    /// Extracts the key names from an arbitrary command.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys<T: FromRedisValue>(_ command: String, _ arg: String...) async throws -> T {
        let cmd = Cmd("COMMAND").arg("GETKEYS").arg(command).arg(arg)
        return try await cmd.query(self)
    }
    /// Extracts the key names from an arbitrary command.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys(_ command: String, _ arg: String...) async throws {
        let cmd = Cmd("COMMAND").arg("GETKEYS").arg(command).arg(arg)
        try await cmd.exec(self)
    }
    /// Returns information about one, multiple or all commands.
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
    /// Returns information about one, multiple or all commands.
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
    /// Returns a list of command names.
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
    /// Returns a list of command names.
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
    /// Extracts the key names and access flags for an arbitrary command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYSANDFLAGS](https://redis.io/commands/command-getkeysandflags)
    public func command_getkeysandflags(_ command: String, _ arg: String...) -> Self {
        let cmd = Cmd("COMMAND").arg("GETKEYSANDFLAGS").arg(command).arg(arg)
        return self.add_command(cmd)
    }
    /// Returns documentary information about one, multiple or all commands.
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
    /// Returns a count of commands.
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
    /// Returns helpful text about the different subcommands.
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
    /// Extracts the key names from an arbitrary command.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the number of arguments to the command
    /// ## Documentation
    /// view the docs for [COMMAND GETKEYS](https://redis.io/commands/command-getkeys)
    public func command_getkeys(_ command: String, _ arg: String...) -> Self {
        let cmd = Cmd("COMMAND").arg("GETKEYS").arg(command).arg(arg)
        return self.add_command(cmd)
    }
    /// Returns information about one, multiple or all commands.
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
    /// Returns a list of command names.
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
