//
//  acl.swift
//
//
//  Created by Autogen on 19.05.23.
//
import Foundation
extension RedisConnection {
    /// Return the name of the user associated to the current connection
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
    /// Return the name of the user associated to the current connection
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
    /// Get the rules for a specific ACL user
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
    /// Get the rules for a specific ACL user
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
    /// Save the current ACL rules in the configured ACL file
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
    /// Save the current ACL rules in the configured ACL file
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
    /// List latest events denied because of ACLs in place
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log<T: FromRedisValue>(_ operation: AclLogOperation? = nil) async throws -> T {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        return try await cmd.query(self)
    }
    /// List latest events denied because of ACLs in place
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log(_ operation: AclLogOperation? = nil) async throws {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        try await cmd.exec(self)
    }
    /// List the ACL categories or the commands inside a category
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat<T: FromRedisValue>(_ categoryname: String? = nil) async throws -> T {
        let cmd = Cmd("ACL").arg("CAT").arg(categoryname)
        return try await cmd.query(self)
    }
    /// List the ACL categories or the commands inside a category
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat(_ categoryname: String? = nil) async throws {
        let cmd = Cmd("ACL").arg("CAT").arg(categoryname)
        try await cmd.exec(self)
    }
    /// Returns whether the user can execute the given command without executing the command.
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
    /// Returns whether the user can execute the given command without executing the command.
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
    /// List the username of all the configured ACL rules
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
    /// List the username of all the configured ACL rules
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
    /// Modify or create the rules for a specific ACL user
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
    /// Modify or create the rules for a specific ACL user
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
    /// Reload the ACLs from the configured ACL file
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
    /// Reload the ACLs from the configured ACL file
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
    /// Show helpful text about the different subcommands
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
    /// Show helpful text about the different subcommands
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
    /// Remove the specified ACL users and the associated rules
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
    /// Remove the specified ACL users and the associated rules
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
    /// Generate a pseudorandom secure password to use for ACL users
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
    /// Generate a pseudorandom secure password to use for ACL users
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
    /// List the current ACL rules in ACL config file format
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
    /// List the current ACL rules in ACL config file format
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
    /// Return the name of the user associated to the current connection
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
    /// Get the rules for a specific ACL user
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
    /// Save the current ACL rules in the configured ACL file
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
    /// List latest events denied because of ACLs in place
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(N) with N being the number of entries shown.
    /// ## Documentation
    /// view the docs for [ACL LOG](https://redis.io/commands/acl-log)
    public func acl_log(_ operation: AclLogOperation? = nil) -> Self {
        let cmd = Cmd("ACL").arg("LOG").arg(operation)
        return self.add_command(cmd)
    }
    /// List the ACL categories or the commands inside a category
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) since the categories and commands are a fixed set.
    /// ## Documentation
    /// view the docs for [ACL CAT](https://redis.io/commands/acl-cat)
    public func acl_cat(_ categoryname: String? = nil) -> Self {
        let cmd = Cmd("ACL").arg("CAT").arg(categoryname)
        return self.add_command(cmd)
    }
    /// Returns whether the user can execute the given command without executing the command.
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
    /// List the username of all the configured ACL rules
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
    /// Modify or create the rules for a specific ACL user
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
    /// Reload the ACLs from the configured ACL file
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
    /// Show helpful text about the different subcommands
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
    /// Remove the specified ACL users and the associated rules
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
    /// Generate a pseudorandom secure password to use for ACL users
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
    /// List the current ACL rules in ACL config file format
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
