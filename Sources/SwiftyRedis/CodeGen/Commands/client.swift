//
//  client.swift
//
//
//  Created by Autogen on 19.05.23.
//
import Foundation
extension RedisConnection {
    /// Unblock a client blocked in a blocking command from a different connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) where N is the number of client connections
    /// ## Documentation
    /// view the docs for [CLIENT UNBLOCK](https://redis.io/commands/client-unblock)
    public func client_unblock<T: FromRedisValue>(_ clientId: Int, _ timeoutError: ClientUnblockTimeouterror? = nil)
        async throws -> T
    {
        let cmd = Cmd("CLIENT").arg("UNBLOCK").arg(clientId).arg(timeoutError)
        return try await cmd.query(self)
    }
    /// Unblock a client blocked in a blocking command from a different connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) where N is the number of client connections
    /// ## Documentation
    /// view the docs for [CLIENT UNBLOCK](https://redis.io/commands/client-unblock)
    public func client_unblock(_ clientId: Int, _ timeoutError: ClientUnblockTimeouterror? = nil) async throws {
        let cmd = Cmd("CLIENT").arg("UNBLOCK").arg(clientId).arg(timeoutError)
        try await cmd.exec(self)
    }
    /// Returns the client ID for the current connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT ID](https://redis.io/commands/client-id)
    public func client_id<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("ID")
        return try await cmd.query(self)
    }
    /// Returns the client ID for the current connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT ID](https://redis.io/commands/client-id)
    public func client_id() async throws {
        let cmd = Cmd("CLIENT").arg("ID")
        try await cmd.exec(self)
    }
    /// Set the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT SETNAME](https://redis.io/commands/client-setname)
    public func client_setname<T: FromRedisValue>(_ connectionName: String) async throws -> T {
        let cmd = Cmd("CLIENT").arg("SETNAME").arg(connectionName)
        return try await cmd.query(self)
    }
    /// Set the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT SETNAME](https://redis.io/commands/client-setname)
    public func client_setname(_ connectionName: String) async throws {
        let cmd = Cmd("CLIENT").arg("SETNAME").arg(connectionName)
        try await cmd.exec(self)
    }
    /// Get the list of client connections
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added unique client `id` field.
    /// - 5.0.0, Added optional `TYPE` filter.
    /// - 6.0.0, Added `user` field.
    /// - 6.2.0, Added `argv-mem`, `tot-mem`, `laddr` and `redir` fields and the optional `ID` filter.
    /// - 7.0.0, Added `resp`, `multi-mem`, `rbs` and `rbp` fields.
    /// - 7.0.3, Added `ssub` field.
    /// ## Documentation
    /// view the docs for [CLIENT LIST](https://redis.io/commands/client-list)
    public func client_list<T: FromRedisValue>(
        _ normalMasterReplicaPubsub: ClientListNormalmasterreplicapubsub? = nil, _ id: ClientListId? = nil
    ) async throws -> T {
        let cmd = Cmd("CLIENT").arg("LIST").arg((normalMasterReplicaPubsub != nil) ? "TYPE" : nil).arg(
            normalMasterReplicaPubsub
        ).arg((id != nil) ? "ID" : nil).arg(id)
        return try await cmd.query(self)
    }
    /// Get the list of client connections
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added unique client `id` field.
    /// - 5.0.0, Added optional `TYPE` filter.
    /// - 6.0.0, Added `user` field.
    /// - 6.2.0, Added `argv-mem`, `tot-mem`, `laddr` and `redir` fields and the optional `ID` filter.
    /// - 7.0.0, Added `resp`, `multi-mem`, `rbs` and `rbp` fields.
    /// - 7.0.3, Added `ssub` field.
    /// ## Documentation
    /// view the docs for [CLIENT LIST](https://redis.io/commands/client-list)
    public func client_list(
        _ normalMasterReplicaPubsub: ClientListNormalmasterreplicapubsub? = nil, _ id: ClientListId? = nil
    ) async throws {
        let cmd = Cmd("CLIENT").arg("LIST").arg((normalMasterReplicaPubsub != nil) ? "TYPE" : nil).arg(
            normalMasterReplicaPubsub
        ).arg((id != nil) ? "ID" : nil).arg(id)
        try await cmd.exec(self)
    }
    /// Returns information about the current client connection.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT INFO](https://redis.io/commands/client-info)
    public func client_info<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("INFO")
        return try await cmd.query(self)
    }
    /// Returns information about the current client connection.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT INFO](https://redis.io/commands/client-info)
    public func client_info() async throws {
        let cmd = Cmd("CLIENT").arg("INFO")
        try await cmd.exec(self)
    }
    /// Get the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETNAME](https://redis.io/commands/client-getname)
    public func client_getname<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("GETNAME")
        return try await cmd.query(self)
    }
    /// Get the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETNAME](https://redis.io/commands/client-getname)
    public func client_getname() async throws {
        let cmd = Cmd("CLIENT").arg("GETNAME")
        try await cmd.exec(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT HELP](https://redis.io/commands/client-help)
    public func client_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT HELP](https://redis.io/commands/client-help)
    public func client_help() async throws {
        let cmd = Cmd("CLIENT").arg("HELP")
        try await cmd.exec(self)
    }
    /// Return information about server assisted client side caching for the current connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT TRACKINGINFO](https://redis.io/commands/client-trackinginfo)
    public func client_trackinginfo<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("TRACKINGINFO")
        return try await cmd.query(self)
    }
    /// Return information about server assisted client side caching for the current connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT TRACKINGINFO](https://redis.io/commands/client-trackinginfo)
    public func client_trackinginfo() async throws {
        let cmd = Cmd("CLIENT").arg("TRACKINGINFO")
        try await cmd.exec(self)
    }
    /// Set client eviction mode for the current connection
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT NO_EVICT](https://redis.io/commands/client-no-evict)
    public func client_no_evict<T: FromRedisValue>(_ enabled: ClientNoEvictEnabled) async throws -> T {
        let cmd = Cmd("CLIENT").arg("NO_EVICT").arg(enabled)
        return try await cmd.query(self)
    }
    /// Set client eviction mode for the current connection
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT NO_EVICT](https://redis.io/commands/client-no-evict)
    public func client_no_evict(_ enabled: ClientNoEvictEnabled) async throws {
        let cmd = Cmd("CLIENT").arg("NO_EVICT").arg(enabled)
        try await cmd.exec(self)
    }
    /// Stop processing commands from clients for some time
    /// ## Available since
    /// 2.9.50
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `CLIENT PAUSE WRITE` mode added along with the `mode` option.
    /// ## Documentation
    /// view the docs for [CLIENT PAUSE](https://redis.io/commands/client-pause)
    public func client_pause<T: FromRedisValue>(_ timeout: Int, _ mode: ClientPauseMode? = nil) async throws -> T {
        let cmd = Cmd("CLIENT").arg("PAUSE").arg(timeout).arg(mode)
        return try await cmd.query(self)
    }
    /// Stop processing commands from clients for some time
    /// ## Available since
    /// 2.9.50
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `CLIENT PAUSE WRITE` mode added along with the `mode` option.
    /// ## Documentation
    /// view the docs for [CLIENT PAUSE](https://redis.io/commands/client-pause)
    public func client_pause(_ timeout: Int, _ mode: ClientPauseMode? = nil) async throws {
        let cmd = Cmd("CLIENT").arg("PAUSE").arg(timeout).arg(mode)
        try await cmd.exec(self)
    }
    /// Instruct the server whether to reply to commands
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT REPLY](https://redis.io/commands/client-reply)
    public func client_reply<T: FromRedisValue>(_ onOffSkip: ClientReplyOnoffskip) async throws -> T {
        let cmd = Cmd("CLIENT").arg("REPLY").arg(onOffSkip)
        return try await cmd.query(self)
    }
    /// Instruct the server whether to reply to commands
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT REPLY](https://redis.io/commands/client-reply)
    public func client_reply(_ onOffSkip: ClientReplyOnoffskip) async throws {
        let cmd = Cmd("CLIENT").arg("REPLY").arg(onOffSkip)
        try await cmd.exec(self)
    }
    /// Kill the connection of a client
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added new filter format.
    /// - 2.8.12, `ID` option.
    /// - 3.2.0, Added `master` type in for `TYPE` option.
    /// - 5.0.0, Replaced `slave` `TYPE` with `replica`. `slave` still supported for backward compatibility.
    /// - 6.2.0, `LADDR` option.
    /// ## Documentation
    /// view the docs for [CLIENT KILL](https://redis.io/commands/client-kill)
    public func client_kill<T: FromRedisValue>(_ filter: ClientKillFilter) async throws -> T {
        let cmd = Cmd("CLIENT").arg("KILL").arg(filter)
        return try await cmd.query(self)
    }
    /// Kill the connection of a client
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added new filter format.
    /// - 2.8.12, `ID` option.
    /// - 3.2.0, Added `master` type in for `TYPE` option.
    /// - 5.0.0, Replaced `slave` `TYPE` with `replica`. `slave` still supported for backward compatibility.
    /// - 6.2.0, `LADDR` option.
    /// ## Documentation
    /// view the docs for [CLIENT KILL](https://redis.io/commands/client-kill)
    public func client_kill(_ filter: ClientKillFilter) async throws {
        let cmd = Cmd("CLIENT").arg("KILL").arg(filter)
        try await cmd.exec(self)
    }
    /// Instruct the server about tracking or not keys in the next request
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT CACHING](https://redis.io/commands/client-caching)
    public func client_caching<T: FromRedisValue>(_ mode: ClientCachingMode) async throws -> T {
        let cmd = Cmd("CLIENT").arg("CACHING").arg(mode)
        return try await cmd.query(self)
    }
    /// Instruct the server about tracking or not keys in the next request
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT CACHING](https://redis.io/commands/client-caching)
    public func client_caching(_ mode: ClientCachingMode) async throws {
        let cmd = Cmd("CLIENT").arg("CACHING").arg(mode)
        try await cmd.exec(self)
    }
    /// Get tracking notifications redirection client ID if any
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETREDIR](https://redis.io/commands/client-getredir)
    public func client_getredir<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("GETREDIR")
        return try await cmd.query(self)
    }
    /// Get tracking notifications redirection client ID if any
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETREDIR](https://redis.io/commands/client-getredir)
    public func client_getredir() async throws {
        let cmd = Cmd("CLIENT").arg("GETREDIR")
        try await cmd.exec(self)
    }
    /// Resume processing of clients that were paused
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) Where N is the number of paused clients
    /// ## Documentation
    /// view the docs for [CLIENT UNPAUSE](https://redis.io/commands/client-unpause)
    public func client_unpause<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT").arg("UNPAUSE")
        return try await cmd.query(self)
    }
    /// Resume processing of clients that were paused
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) Where N is the number of paused clients
    /// ## Documentation
    /// view the docs for [CLIENT UNPAUSE](https://redis.io/commands/client-unpause)
    public func client_unpause() async throws {
        let cmd = Cmd("CLIENT").arg("UNPAUSE")
        try await cmd.exec(self)
    }
    /// Enable or disable server assisted client side caching support
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1). Some options may introduce additional complexity.
    /// ## Documentation
    /// view the docs for [CLIENT TRACKING](https://redis.io/commands/client-tracking)
    public func client_tracking<T: FromRedisValue>(
        _ status: ClientTrackingStatus, _ clientId: Int? = nil, _ prefix: String...,
        options: ClientTrackingOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("CLIENT").arg("TRACKING").arg(status).arg((clientId != nil) ? "REDIRECT" : nil).arg(clientId).arg(
            (!prefix.isEmpty) ? "PREFIX" : nil
        ).arg(prefix).arg(options)
        return try await cmd.query(self)
    }
    /// Enable or disable server assisted client side caching support
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1). Some options may introduce additional complexity.
    /// ## Documentation
    /// view the docs for [CLIENT TRACKING](https://redis.io/commands/client-tracking)
    public func client_tracking(
        _ status: ClientTrackingStatus, _ clientId: Int? = nil, _ prefix: String...,
        options: ClientTrackingOptions? = nil
    ) async throws {
        let cmd = Cmd("CLIENT").arg("TRACKING").arg(status).arg((clientId != nil) ? "REDIRECT" : nil).arg(clientId).arg(
            (!prefix.isEmpty) ? "PREFIX" : nil
        ).arg(prefix).arg(options)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Unblock a client blocked in a blocking command from a different connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) where N is the number of client connections
    /// ## Documentation
    /// view the docs for [CLIENT UNBLOCK](https://redis.io/commands/client-unblock)
    public func client_unblock(_ clientId: Int, _ timeoutError: ClientUnblockTimeouterror? = nil) -> Self {
        let cmd = Cmd("CLIENT").arg("UNBLOCK").arg(clientId).arg(timeoutError)
        return self.add_command(cmd)
    }
    /// Returns the client ID for the current connection
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT ID](https://redis.io/commands/client-id)
    public func client_id() -> Self {
        let cmd = Cmd("CLIENT").arg("ID")
        return self.add_command(cmd)
    }
    /// Set the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT SETNAME](https://redis.io/commands/client-setname)
    public func client_setname(_ connectionName: String) -> Self {
        let cmd = Cmd("CLIENT").arg("SETNAME").arg(connectionName)
        return self.add_command(cmd)
    }
    /// Get the list of client connections
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added unique client `id` field.
    /// - 5.0.0, Added optional `TYPE` filter.
    /// - 6.0.0, Added `user` field.
    /// - 6.2.0, Added `argv-mem`, `tot-mem`, `laddr` and `redir` fields and the optional `ID` filter.
    /// - 7.0.0, Added `resp`, `multi-mem`, `rbs` and `rbp` fields.
    /// - 7.0.3, Added `ssub` field.
    /// ## Documentation
    /// view the docs for [CLIENT LIST](https://redis.io/commands/client-list)
    public func client_list(
        _ normalMasterReplicaPubsub: ClientListNormalmasterreplicapubsub? = nil, _ id: ClientListId? = nil
    ) -> Self {
        let cmd = Cmd("CLIENT").arg("LIST").arg((normalMasterReplicaPubsub != nil) ? "TYPE" : nil).arg(
            normalMasterReplicaPubsub
        ).arg((id != nil) ? "ID" : nil).arg(id)
        return self.add_command(cmd)
    }
    /// Returns information about the current client connection.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT INFO](https://redis.io/commands/client-info)
    public func client_info() -> Self {
        let cmd = Cmd("CLIENT").arg("INFO")
        return self.add_command(cmd)
    }
    /// Get the current connection name
    /// ## Available since
    /// 2.6.9
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETNAME](https://redis.io/commands/client-getname)
    public func client_getname() -> Self {
        let cmd = Cmd("CLIENT").arg("GETNAME")
        return self.add_command(cmd)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT HELP](https://redis.io/commands/client-help)
    public func client_help() -> Self {
        let cmd = Cmd("CLIENT").arg("HELP")
        return self.add_command(cmd)
    }
    /// Return information about server assisted client side caching for the current connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT TRACKINGINFO](https://redis.io/commands/client-trackinginfo)
    public func client_trackinginfo() -> Self {
        let cmd = Cmd("CLIENT").arg("TRACKINGINFO")
        return self.add_command(cmd)
    }
    /// Set client eviction mode for the current connection
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT NO_EVICT](https://redis.io/commands/client-no-evict)
    public func client_no_evict(_ enabled: ClientNoEvictEnabled) -> Self {
        let cmd = Cmd("CLIENT").arg("NO_EVICT").arg(enabled)
        return self.add_command(cmd)
    }
    /// Stop processing commands from clients for some time
    /// ## Available since
    /// 2.9.50
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `CLIENT PAUSE WRITE` mode added along with the `mode` option.
    /// ## Documentation
    /// view the docs for [CLIENT PAUSE](https://redis.io/commands/client-pause)
    public func client_pause(_ timeout: Int, _ mode: ClientPauseMode? = nil) -> Self {
        let cmd = Cmd("CLIENT").arg("PAUSE").arg(timeout).arg(mode)
        return self.add_command(cmd)
    }
    /// Instruct the server whether to reply to commands
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT REPLY](https://redis.io/commands/client-reply)
    public func client_reply(_ onOffSkip: ClientReplyOnoffskip) -> Self {
        let cmd = Cmd("CLIENT").arg("REPLY").arg(onOffSkip)
        return self.add_command(cmd)
    }
    /// Kill the connection of a client
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the number of client connections
    /// ## History
    /// - 2.8.12, Added new filter format.
    /// - 2.8.12, `ID` option.
    /// - 3.2.0, Added `master` type in for `TYPE` option.
    /// - 5.0.0, Replaced `slave` `TYPE` with `replica`. `slave` still supported for backward compatibility.
    /// - 6.2.0, `LADDR` option.
    /// ## Documentation
    /// view the docs for [CLIENT KILL](https://redis.io/commands/client-kill)
    public func client_kill(_ filter: ClientKillFilter) -> Self {
        let cmd = Cmd("CLIENT").arg("KILL").arg(filter)
        return self.add_command(cmd)
    }
    /// Instruct the server about tracking or not keys in the next request
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT CACHING](https://redis.io/commands/client-caching)
    public func client_caching(_ mode: ClientCachingMode) -> Self {
        let cmd = Cmd("CLIENT").arg("CACHING").arg(mode)
        return self.add_command(cmd)
    }
    /// Get tracking notifications redirection client ID if any
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CLIENT GETREDIR](https://redis.io/commands/client-getredir)
    public func client_getredir() -> Self {
        let cmd = Cmd("CLIENT").arg("GETREDIR")
        return self.add_command(cmd)
    }
    /// Resume processing of clients that were paused
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) Where N is the number of paused clients
    /// ## Documentation
    /// view the docs for [CLIENT UNPAUSE](https://redis.io/commands/client-unpause)
    public func client_unpause() -> Self {
        let cmd = Cmd("CLIENT").arg("UNPAUSE")
        return self.add_command(cmd)
    }
    /// Enable or disable server assisted client side caching support
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1). Some options may introduce additional complexity.
    /// ## Documentation
    /// view the docs for [CLIENT TRACKING](https://redis.io/commands/client-tracking)
    public func client_tracking(
        _ status: ClientTrackingStatus, _ clientId: Int? = nil, _ prefix: String...,
        options: ClientTrackingOptions? = nil
    ) -> Self {
        let cmd = Cmd("CLIENT").arg("TRACKING").arg(status).arg((clientId != nil) ? "REDIRECT" : nil).arg(clientId).arg(
            (!prefix.isEmpty) ? "PREFIX" : nil
        ).arg(prefix).arg(options)
        return self.add_command(cmd)
    }
}
public enum ClientUnblockTimeouterror: ToRedisArgs {
    case TIMEOUT
    case ERROR
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .TIMEOUT: out.append("TIMEOUT".data(using: .utf8)!)
        case .ERROR: out.append("ERROR".data(using: .utf8)!)
        }
    }
}
public enum ClientListNormalmasterreplicapubsub: ToRedisArgs {
    case normal
    case master
    case replica
    case pubsub
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .normal: out.append("normal".data(using: .utf8)!)
        case .master: out.append("master".data(using: .utf8)!)
        case .replica: out.append("replica".data(using: .utf8)!)
        case .pubsub: out.append("pubsub".data(using: .utf8)!)
        }
    }
}
public struct ClientListId: ToRedisArgs {
    let clientId: [Int]
    public init(_ clientId: Int...) { self.clientId = clientId }
    public func write_redis_args(out: inout [Data]) { clientId.write_redis_args(out: &out) }
}
public enum ClientNoEvictEnabled: ToRedisArgs {
    case ON
    case OFF
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ON: out.append("ON".data(using: .utf8)!)
        case .OFF: out.append("OFF".data(using: .utf8)!)
        }
    }
}
public enum ClientPauseMode: ToRedisArgs {
    case WRITE
    case ALL
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .WRITE: out.append("WRITE".data(using: .utf8)!)
        case .ALL: out.append("ALL".data(using: .utf8)!)
        }
    }
}
public enum ClientReplyOnoffskip: ToRedisArgs {
    case ON
    case OFF
    case SKIP
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ON: out.append("ON".data(using: .utf8)!)
        case .OFF: out.append("OFF".data(using: .utf8)!)
        case .SKIP: out.append("SKIP".data(using: .utf8)!)
        }
    }
}
public enum ClientKillFilter: ToRedisArgs {
    case IP_PORT(String)
    case NEW_FORMAT(Newformat)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .IP_PORT(let string): string.write_redis_args(out: &out)
        case .NEW_FORMAT(let newformat): newformat.write_redis_args(out: &out)
        }
    }
    public enum Newformat: ToRedisArgs {
        case ID(Int)
        case TYPE(Normalmasterslavepubsub)
        case USER(String)
        case ADDR(String)
        case LADDR(String)
        case SKIPME(String)
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .ID(let int):
                out.append("ID".data(using: .utf8)!)
                int.write_redis_args(out: &out)
            case .TYPE(let normalmasterslavepubsub):
                out.append("TYPE".data(using: .utf8)!)
                normalmasterslavepubsub.write_redis_args(out: &out)
            case .USER(let string):
                out.append("USER".data(using: .utf8)!)
                string.write_redis_args(out: &out)
            case .ADDR(let string):
                out.append("ADDR".data(using: .utf8)!)
                string.write_redis_args(out: &out)
            case .LADDR(let string):
                out.append("LADDR".data(using: .utf8)!)
                string.write_redis_args(out: &out)
            case .SKIPME(let string):
                out.append("SKIPME".data(using: .utf8)!)
                string.write_redis_args(out: &out)
            }
        }
        public enum Normalmasterslavepubsub: ToRedisArgs {
            case normal
            case master
            case slave
            case replica
            case pubsub
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .normal: out.append("normal".data(using: .utf8)!)
                case .master: out.append("master".data(using: .utf8)!)
                case .slave: out.append("slave".data(using: .utf8)!)
                case .replica: out.append("replica".data(using: .utf8)!)
                case .pubsub: out.append("pubsub".data(using: .utf8)!)
                }
            }
        }
    }
}
public enum ClientCachingMode: ToRedisArgs {
    case YES
    case NO
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .YES: out.append("YES".data(using: .utf8)!)
        case .NO: out.append("NO".data(using: .utf8)!)
        }
    }
}
public enum ClientTrackingStatus: ToRedisArgs {
    case ON
    case OFF
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ON: out.append("ON".data(using: .utf8)!)
        case .OFF: out.append("OFF".data(using: .utf8)!)
        }
    }
}
public struct ClientTrackingOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let BCAST = ClientTrackingOptions(rawValue: 1 << 0)
    public static let OPTIN = ClientTrackingOptions(rawValue: 1 << 1)
    public static let OPTOUT = ClientTrackingOptions(rawValue: 1 << 2)
    public static let NOLOOP = ClientTrackingOptions(rawValue: 1 << 3)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.BCAST) { out.append("BCAST".data(using: .utf8)!) }
        if self.contains(.OPTIN) { out.append("OPTIN".data(using: .utf8)!) }
        if self.contains(.OPTOUT) { out.append("OPTOUT".data(using: .utf8)!) }
        if self.contains(.NOLOOP) { out.append("NOLOOP".data(using: .utf8)!) }
    }
}
