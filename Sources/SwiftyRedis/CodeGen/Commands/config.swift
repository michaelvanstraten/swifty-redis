//
//  config.swift
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
    /// view the docs for [CONFIG HELP](https://redis.io/commands/config-help)
    public func config_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CONFIG").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG HELP](https://redis.io/commands/config-help)
    public func config_help() async throws {
        let cmd = Cmd("CONFIG").arg("HELP")
        try await cmd.exec(self)
    }
    /// Rewrite the configuration file with the in memory configuration
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG REWRITE](https://redis.io/commands/config-rewrite)
    public func config_rewrite<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CONFIG").arg("REWRITE")
        return try await cmd.query(self)
    }
    /// Rewrite the configuration file with the in memory configuration
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG REWRITE](https://redis.io/commands/config-rewrite)
    public func config_rewrite() async throws {
        let cmd = Cmd("CONFIG").arg("REWRITE")
        try await cmd.exec(self)
    }
    /// Reset the stats returned by INFO
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG RESETSTAT](https://redis.io/commands/config-resetstat)
    public func config_resetstat<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CONFIG").arg("RESETSTAT")
        return try await cmd.query(self)
    }
    /// Reset the stats returned by INFO
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG RESETSTAT](https://redis.io/commands/config-resetstat)
    public func config_resetstat() async throws {
        let cmd = Cmd("CONFIG").arg("RESETSTAT")
        try await cmd.exec(self)
    }
    /// Get the values of configuration parameters
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to pass multiple pattern parameters in one call
    /// ## Documentation
    /// view the docs for [CONFIG GET](https://redis.io/commands/config-get)
    public func config_get<T: FromRedisValue>(_ parameter: ConfigGetParameter...) async throws -> T {
        let cmd = Cmd("CONFIG").arg("GET").arg(parameter)
        return try await cmd.query(self)
    }
    /// Get the values of configuration parameters
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to pass multiple pattern parameters in one call
    /// ## Documentation
    /// view the docs for [CONFIG GET](https://redis.io/commands/config-get)
    public func config_get(_ parameter: ConfigGetParameter...) async throws {
        let cmd = Cmd("CONFIG").arg("GET").arg(parameter)
        try await cmd.exec(self)
    }
    /// Set configuration parameters to the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to set multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [CONFIG SET](https://redis.io/commands/config-set)
    public func config_set<T: FromRedisValue>(_ parameterValue: ConfigSetParametervalue...) async throws -> T {
        let cmd = Cmd("CONFIG").arg("SET").arg(parameterValue)
        return try await cmd.query(self)
    }
    /// Set configuration parameters to the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to set multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [CONFIG SET](https://redis.io/commands/config-set)
    public func config_set(_ parameterValue: ConfigSetParametervalue...) async throws {
        let cmd = Cmd("CONFIG").arg("SET").arg(parameterValue)
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
    /// view the docs for [CONFIG HELP](https://redis.io/commands/config-help)
    public func config_help() -> Self {
        let cmd = Cmd("CONFIG").arg("HELP")
        return self.add_command(cmd)
    }
    /// Rewrite the configuration file with the in memory configuration
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG REWRITE](https://redis.io/commands/config-rewrite)
    public func config_rewrite() -> Self {
        let cmd = Cmd("CONFIG").arg("REWRITE")
        return self.add_command(cmd)
    }
    /// Reset the stats returned by INFO
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [CONFIG RESETSTAT](https://redis.io/commands/config-resetstat)
    public func config_resetstat() -> Self {
        let cmd = Cmd("CONFIG").arg("RESETSTAT")
        return self.add_command(cmd)
    }
    /// Get the values of configuration parameters
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to pass multiple pattern parameters in one call
    /// ## Documentation
    /// view the docs for [CONFIG GET](https://redis.io/commands/config-get)
    public func config_get(_ parameter: ConfigGetParameter...) -> Self {
        let cmd = Cmd("CONFIG").arg("GET").arg(parameter)
        return self.add_command(cmd)
    }
    /// Set configuration parameters to the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.0.0, Added the ability to set multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [CONFIG SET](https://redis.io/commands/config-set)
    public func config_set(_ parameterValue: ConfigSetParametervalue...) -> Self {
        let cmd = Cmd("CONFIG").arg("SET").arg(parameterValue)
        return self.add_command(cmd)
    }
}
public struct ConfigGetParameter: ToRedisArgs {
    let parameter: String
    public init(_ parameter: String) { self.parameter = parameter }
    public func write_redis_args(out: inout [Data]) { parameter.write_redis_args(out: &out) }
}
public struct ConfigSetParametervalue: ToRedisArgs {
    let parameter: String
    let value: String
    public init(_ parameter: String, _ value: String) {
        self.parameter = parameter
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        parameter.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
