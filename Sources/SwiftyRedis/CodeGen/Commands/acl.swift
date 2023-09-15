//
//  acl.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns the authenticated username of the current connection.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL WHOAMI](https://redis.io/commands/acl-whoami)
    public func acl_whoami<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("WHOAMI")
        return try await cmd.query(self)
    }
    /// Returns the authenticated username of the current connection.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL WHOAMI](https://redis.io/commands/acl-whoami)
    public func acl_whoami() async throws {
        let cmd = Cmd("ACL").arg("WHOAMI")
        try await cmd.exec(self)
    }
    /// Lists the ACL rules of a user.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of password, command and pattern rules that the user has.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and changed the format of key and channel patterns from a list to their rule representation.
    /// ## Documentation
    /// view the docs for [ACL GETUSER](https://redis.io/commands/acl-getuser)
    public func acl_getuser<T: FromRedisValue>(_ username: String) async throws -> T {
        let cmd = Cmd("ACL").arg("GETUSER").arg(username)
        return try await cmd.query(self)
    }
    /// Lists the ACL rules of a user.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of password, command and pattern rules that the user has.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and changed the format of key and channel patterns from a list to their rule representation.
    /// ## Documentation
    /// view the docs for [ACL GETUSER](https://redis.io/commands/acl-getuser)
    public func acl_getuser(_ username: String) async throws {
        let cmd = Cmd("ACL").arg("GETUSER").arg(username)
        try await cmd.exec(self)
    }
    /// Saves the effective ACL rules in the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL SAVE](https://redis.io/commands/acl-save)
    public func acl_save<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("SAVE")
        return try await cmd.query(self)
    }
    /// Saves the effective ACL rules in the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL SAVE](https://redis.io/commands/acl-save)
    public func acl_save() async throws {
        let cmd = Cmd("ACL").arg("SAVE")
        try await cmd.exec(self)
    }
    /// Lists recent security events generated due to ACL rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## History
    /// - 7.2.0, Added entry ID, timestamp created, and timestamp last updated.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log<T: FromRedisValue>(_ operation: AclLogOperation? = nil) async throws -> T {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        return try await cmd.query(self)
    }
    /// Lists recent security events generated due to ACL rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## History
    /// - 7.2.0, Added entry ID, timestamp created, and timestamp last updated.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log(_ operation: AclLogOperation? = nil) async throws {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        try await cmd.exec(self)
    }
    /// Lists the ACL categories, or the commands inside a category.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat<T: FromRedisValue>(_ category: String? = nil) async throws -> T {
        let cmd = Cmd("ACL").arg("CAT").arg(category)
        return try await cmd.query(self)
    }
    /// Lists the ACL categories, or the commands inside a category.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat(_ category: String? = nil) async throws {
        let cmd = Cmd("ACL").arg("CAT").arg(category)
        try await cmd.exec(self)
    }
    /// Simulates the execution of a command by a user, without executing the command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1).
    /// ## Documentation
    /// view the docs for [ACL DRYRUN](https://redis.io/commands/acl-dryrun)
    public func acl_dryrun<T: FromRedisValue>(_ username: String, _ command: String, _ arg: String...) async throws -> T
    {
        let cmd = Cmd("ACL").arg("DRYRUN").arg(username).arg(command).arg(arg)
        return try await cmd.query(self)
    }
    /// Simulates the execution of a command by a user, without executing the command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1).
    /// ## Documentation
    /// view the docs for [ACL DRYRUN](https://redis.io/commands/acl-dryrun)
    public func acl_dryrun(_ username: String, _ command: String, _ arg: String...) async throws {
        let cmd = Cmd("ACL").arg("DRYRUN").arg(username).arg(command).arg(arg)
        try await cmd.exec(self)
    }
    /// Lists all ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL USERS](https://redis.io/commands/acl-users)
    public func acl_users<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("USERS")
        return try await cmd.query(self)
    }
    /// Lists all ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL USERS](https://redis.io/commands/acl-users)
    public func acl_users() async throws {
        let cmd = Cmd("ACL").arg("USERS")
        try await cmd.exec(self)
    }
    /// Creates and modifies an ACL user and its rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of rules provided.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and key based permissions.
    /// ## Documentation
    /// view the docs for [ACL SETUSER](https://redis.io/commands/acl-setuser)
    public func acl_setuser<T: FromRedisValue>(_ username: String, _ rule: String...) async throws -> T {
        let cmd = Cmd("ACL").arg("SETUSER").arg(username).arg(rule)
        return try await cmd.query(self)
    }
    /// Creates and modifies an ACL user and its rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of rules provided.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and key based permissions.
    /// ## Documentation
    /// view the docs for [ACL SETUSER](https://redis.io/commands/acl-setuser)
    public func acl_setuser(_ username: String, _ rule: String...) async throws {
        let cmd = Cmd("ACL").arg("SETUSER").arg(username).arg(rule)
        try await cmd.exec(self)
    }
    /// Reloads the rules from the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LOAD](https://redis.io/commands/acl-load)
    public func acl_load<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("LOAD")
        return try await cmd.query(self)
    }
    /// Reloads the rules from the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LOAD](https://redis.io/commands/acl-load)
    public func acl_load() async throws {
        let cmd = Cmd("ACL").arg("LOAD")
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL HELP](https://redis.io/commands/acl-help)
    public func acl_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL HELP](https://redis.io/commands/acl-help)
    public func acl_help() async throws {
        let cmd = Cmd("ACL").arg("HELP")
        try await cmd.exec(self)
    }
    /// Deletes ACL users, and terminates their connections.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) amortized time considering the typical user.
    /// ## Documentation
    /// view the docs for [ACL DELUSER](https://redis.io/commands/acl-deluser)
    public func acl_deluser<T: FromRedisValue>(_ username: String...) async throws -> T {
        let cmd = Cmd("ACL").arg("DELUSER").arg(username)
        return try await cmd.query(self)
    }
    /// Deletes ACL users, and terminates their connections.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) amortized time considering the typical user.
    /// ## Documentation
    /// view the docs for [ACL DELUSER](https://redis.io/commands/acl-deluser)
    public func acl_deluser(_ username: String...) async throws {
        let cmd = Cmd("ACL").arg("DELUSER").arg(username)
        try await cmd.exec(self)
    }
    /// Generates a pseudorandom, secure password that can be used to identify ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL GENPASS](https://redis.io/commands/acl-genpass)
    public func acl_genpass<T: FromRedisValue>(_ bits: Int? = nil) async throws -> T {
        let cmd = Cmd("ACL").arg("GENPASS").arg(bits)
        return try await cmd.query(self)
    }
    /// Generates a pseudorandom, secure password that can be used to identify ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL GENPASS](https://redis.io/commands/acl-genpass)
    public func acl_genpass(_ bits: Int? = nil) async throws {
        let cmd = Cmd("ACL").arg("GENPASS").arg(bits)
        try await cmd.exec(self)
    }
    /// Dumps the effective rules in ACL file format.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LIST](https://redis.io/commands/acl-list)
    public func acl_list<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL").arg("LIST")
        return try await cmd.query(self)
    }
    /// Dumps the effective rules in ACL file format.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LIST](https://redis.io/commands/acl-list)
    public func acl_list() async throws {
        let cmd = Cmd("ACL").arg("LIST")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns the authenticated username of the current connection.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL WHOAMI](https://redis.io/commands/acl-whoami)
    public func acl_whoami() -> Self {
        let cmd = Cmd("ACL").arg("WHOAMI")
        return self.add_command(cmd)
    }
    /// Lists the ACL rules of a user.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of password, command and pattern rules that the user has.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and changed the format of key and channel patterns from a list to their rule representation.
    /// ## Documentation
    /// view the docs for [ACL GETUSER](https://redis.io/commands/acl-getuser)
    public func acl_getuser(_ username: String) -> Self {
        let cmd = Cmd("ACL").arg("GETUSER").arg(username)
        return self.add_command(cmd)
    }
    /// Saves the effective ACL rules in the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL SAVE](https://redis.io/commands/acl-save)
    public func acl_save() -> Self {
        let cmd = Cmd("ACL").arg("SAVE")
        return self.add_command(cmd)
    }
    /// Lists recent security events generated due to ACL rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## History
    /// - 7.2.0, Added entry ID, timestamp created, and timestamp last updated.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log(_ operation: AclLogOperation? = nil) -> Self {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        return self.add_command(cmd)
    }
    /// Lists the ACL categories, or the commands inside a category.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat(_ category: String? = nil) -> Self {
        let cmd = Cmd("ACL").arg("CAT").arg(category)
        return self.add_command(cmd)
    }
    /// Simulates the execution of a command by a user, without executing the command.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1).
    /// ## Documentation
    /// view the docs for [ACL DRYRUN](https://redis.io/commands/acl-dryrun)
    public func acl_dryrun(_ username: String, _ command: String, _ arg: String...) -> Self {
        let cmd = Cmd("ACL").arg("DRYRUN").arg(username).arg(command).arg(arg)
        return self.add_command(cmd)
    }
    /// Lists all ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL USERS](https://redis.io/commands/acl-users)
    public func acl_users() -> Self {
        let cmd = Cmd("ACL").arg("USERS")
        return self.add_command(cmd)
    }
    /// Creates and modifies an ACL user and its rules.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of rules provided.
    /// ## History
    /// - 6.2.0, Added Pub/Sub channel patterns.
    /// - 7.0.0, Added selectors and key based permissions.
    /// ## Documentation
    /// view the docs for [ACL SETUSER](https://redis.io/commands/acl-setuser)
    public func acl_setuser(_ username: String, _ rule: String...) -> Self {
        let cmd = Cmd("ACL").arg("SETUSER").arg(username).arg(rule)
        return self.add_command(cmd)
    }
    /// Reloads the rules from the configured ACL file.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LOAD](https://redis.io/commands/acl-load)
    public func acl_load() -> Self {
        let cmd = Cmd("ACL").arg("LOAD")
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL HELP](https://redis.io/commands/acl-help)
    public func acl_help() -> Self {
        let cmd = Cmd("ACL").arg("HELP")
        return self.add_command(cmd)
    }
    /// Deletes ACL users, and terminates their connections.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) amortized time considering the typical user.
    /// ## Documentation
    /// view the docs for [ACL DELUSER](https://redis.io/commands/acl-deluser)
    public func acl_deluser(_ username: String...) -> Self {
        let cmd = Cmd("ACL").arg("DELUSER").arg(username)
        return self.add_command(cmd)
    }
    /// Generates a pseudorandom, secure password that can be used to identify ACL users.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ACL GENPASS](https://redis.io/commands/acl-genpass)
    public func acl_genpass(_ bits: Int? = nil) -> Self {
        let cmd = Cmd("ACL").arg("GENPASS").arg(bits)
        return self.add_command(cmd)
    }
    /// Dumps the effective rules in ACL file format.
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N). Where N is the number of configured users.
    /// ## Documentation
    /// view the docs for [ACL LIST](https://redis.io/commands/acl-list)
    public func acl_list() -> Self {
        let cmd = Cmd("ACL").arg("LIST")
        return self.add_command(cmd)
    }
}
public enum AclLogOperation: ToRedisArgs {
    case COUNT(Int)
    case RESET
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .COUNT(let int): int.write_redis_args(out: &out)
        case .RESET: out.append("RESET".data(using: .utf8)!)
        }
    }
}
