//
//  pubsub.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns a count of subscribers to channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) for the NUMSUB subcommand, where N is the number of requested channels
    /// ## Documentation
    /// view the docs for [PUBSUB NUMSUB](https://redis.io/commands/pubsub-numsub)
    public func pubsub_numsub<T: FromRedisValue>(_ channel: String...) async throws -> T {
        let cmd = Cmd("PUBSUB").arg("NUMSUB").arg(channel)
        return try await cmd.query(self)
    }
    /// Returns a count of subscribers to channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) for the NUMSUB subcommand, where N is the number of requested channels
    /// ## Documentation
    /// view the docs for [PUBSUB NUMSUB](https://redis.io/commands/pubsub-numsub)
    public func pubsub_numsub(_ channel: String...) async throws {
        let cmd = Cmd("PUBSUB").arg("NUMSUB").arg(channel)
        try await cmd.exec(self)
    }
    /// Returns the count of subscribers of shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) for the SHARDNUMSUB subcommand, where N is the number of requested shard channels
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDNUMSUB](https://redis.io/commands/pubsub-shardnumsub)
    public func pubsub_shardnumsub<T: FromRedisValue>(_ shardchannel: String...) async throws -> T {
        let cmd = Cmd("PUBSUB").arg("SHARDNUMSUB").arg(shardchannel)
        return try await cmd.query(self)
    }
    /// Returns the count of subscribers of shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) for the SHARDNUMSUB subcommand, where N is the number of requested shard channels
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDNUMSUB](https://redis.io/commands/pubsub-shardnumsub)
    public func pubsub_shardnumsub(_ shardchannel: String...) async throws {
        let cmd = Cmd("PUBSUB").arg("SHARDNUMSUB").arg(shardchannel)
        try await cmd.exec(self)
    }
    /// Returns the active shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of active shard channels, and assuming constant time pattern matching (relatively short shard channels).
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDCHANNELS](https://redis.io/commands/pubsub-shardchannels)
    public func pubsub_shardchannels<T: FromRedisValue>(_ pattern: String? = nil) async throws -> T {
        let cmd = Cmd("PUBSUB").arg("SHARDCHANNELS").arg(pattern)
        return try await cmd.query(self)
    }
    /// Returns the active shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of active shard channels, and assuming constant time pattern matching (relatively short shard channels).
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDCHANNELS](https://redis.io/commands/pubsub-shardchannels)
    public func pubsub_shardchannels(_ pattern: String? = nil) async throws {
        let cmd = Cmd("PUBSUB").arg("SHARDCHANNELS").arg(pattern)
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB HELP](https://redis.io/commands/pubsub-help)
    public func pubsub_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("PUBSUB").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB HELP](https://redis.io/commands/pubsub-help)
    public func pubsub_help() async throws {
        let cmd = Cmd("PUBSUB").arg("HELP")
        try await cmd.exec(self)
    }
    /// Returns a count of unique pattern subscriptions.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB NUMPAT](https://redis.io/commands/pubsub-numpat)
    public func pubsub_numpat<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("PUBSUB").arg("NUMPAT")
        return try await cmd.query(self)
    }
    /// Returns a count of unique pattern subscriptions.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB NUMPAT](https://redis.io/commands/pubsub-numpat)
    public func pubsub_numpat() async throws {
        let cmd = Cmd("PUBSUB").arg("NUMPAT")
        try await cmd.exec(self)
    }
    /// Returns the active channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of active channels, and assuming constant time pattern matching (relatively short channels and patterns)
    /// ## Documentation
    /// view the docs for [PUBSUB CHANNELS](https://redis.io/commands/pubsub-channels)
    public func pubsub_channels<T: FromRedisValue>(_ pattern: String? = nil) async throws -> T {
        let cmd = Cmd("PUBSUB").arg("CHANNELS").arg(pattern)
        return try await cmd.query(self)
    }
    /// Returns the active channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of active channels, and assuming constant time pattern matching (relatively short channels and patterns)
    /// ## Documentation
    /// view the docs for [PUBSUB CHANNELS](https://redis.io/commands/pubsub-channels)
    public func pubsub_channels(_ pattern: String? = nil) async throws {
        let cmd = Cmd("PUBSUB").arg("CHANNELS").arg(pattern)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns a count of subscribers to channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) for the NUMSUB subcommand, where N is the number of requested channels
    /// ## Documentation
    /// view the docs for [PUBSUB NUMSUB](https://redis.io/commands/pubsub-numsub)
    public func pubsub_numsub(_ channel: String...) -> Self {
        let cmd = Cmd("PUBSUB").arg("NUMSUB").arg(channel)
        return self.add_command(cmd)
    }
    /// Returns the count of subscribers of shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) for the SHARDNUMSUB subcommand, where N is the number of requested shard channels
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDNUMSUB](https://redis.io/commands/pubsub-shardnumsub)
    public func pubsub_shardnumsub(_ shardchannel: String...) -> Self {
        let cmd = Cmd("PUBSUB").arg("SHARDNUMSUB").arg(shardchannel)
        return self.add_command(cmd)
    }
    /// Returns the active shard channels.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of active shard channels, and assuming constant time pattern matching (relatively short shard channels).
    /// ## Documentation
    /// view the docs for [PUBSUB SHARDCHANNELS](https://redis.io/commands/pubsub-shardchannels)
    public func pubsub_shardchannels(_ pattern: String? = nil) -> Self {
        let cmd = Cmd("PUBSUB").arg("SHARDCHANNELS").arg(pattern)
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB HELP](https://redis.io/commands/pubsub-help)
    public func pubsub_help() -> Self {
        let cmd = Cmd("PUBSUB").arg("HELP")
        return self.add_command(cmd)
    }
    /// Returns a count of unique pattern subscriptions.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PUBSUB NUMPAT](https://redis.io/commands/pubsub-numpat)
    public func pubsub_numpat() -> Self {
        let cmd = Cmd("PUBSUB").arg("NUMPAT")
        return self.add_command(cmd)
    }
    /// Returns the active channels.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of active channels, and assuming constant time pattern matching (relatively short channels and patterns)
    /// ## Documentation
    /// view the docs for [PUBSUB CHANNELS](https://redis.io/commands/pubsub-channels)
    public func pubsub_channels(_ pattern: String? = nil) -> Self {
        let cmd = Cmd("PUBSUB").arg("CHANNELS").arg(pattern)
        return self.add_command(cmd)
    }
}
