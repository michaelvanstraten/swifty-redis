//
//  PubSub.swift
//
//
//  Created by Michael van Straten on 15.02.23.
//

import Foundation

public class PubSubConnection {
    let con: RedisConnection

    internal init(con: RedisConnection) {
        self.con = con
    }

    /// Listen for messages published to the given channels
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of channels to subscribe to.
    /// ## Documentation
    /// view the docs for [SUBSCRIBE](https://redis.io/commands/subscribe)
    public func subscribe(_ channel: String...) async throws {
        let cmd = Cmd("SUBSCRIBE").arg(channel)
        try await con.send_packed_command(cmd.pack_command())
    }

    /// Listen for messages published to channels matching the given patterns
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of patterns the client is already subscribed to.
    /// ## Documentation
    /// view the docs for [PSUBSCRIBE](https://redis.io/commands/psubscribe)
    public func psubscribe(_ pattern: String...) async throws {
        let cmd = Cmd("PSUBSCRIBE").arg(pattern)
        try await con.send_packed_command(cmd.pack_command())
    }

    /// Listen for messages published to the given shard channels
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of shard channels to subscribe to.
    /// ## Documentation
    /// view the docs for [SSUBSCRIBE](https://redis.io/commands/ssubscribe)
    public func ssubscribe(_ shardchannel: String...) async throws {
        let cmd = Cmd("SSUBSCRIBE").arg(shardchannel)
        try await con.send_packed_command(cmd.pack_command())
    }

    /// Stop listening for messages posted to the given channels
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of clients already subscribed to a channel.
    /// ## Documentation
    /// view the docs for [UNSUBSCRIBE](https://redis.io/commands/unsubscribe)
    public func unsubscribe(_ channel: String...) async throws {
        let cmd = Cmd("UNSUBSCRIBE").arg(channel)
        try await con.send_packed_command(cmd.pack_command())
    }

    /// Stop listening for messages posted to channels matching the given patterns
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of patterns the client is already subscribed and M is the number of total patterns subscribed in the system (by any client).
    /// ## Documentation
    /// view the docs for [PUNSUBSCRIBE](https://redis.io/commands/punsubscribe)
    public func punsubscribe(_ pattern: String...) async throws {
        let cmd = Cmd("PUNSUBSCRIBE").arg(pattern)
        try await con.send_packed_command(cmd.pack_command())
    }

    /// Stop listening for messages posted to the given shard channels
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of clients already subscribed to a shard channel.
    /// ## Documentation
    /// view the docs for [SUNSUBSCRIBE](https://redis.io/commands/sunsubscribe)
    public func sunsubscribe(_ shardchannel: String...) async throws {
        let cmd = Cmd("SUNSUBSCRIBE").arg(shardchannel)
        try await con.send_packed_command(cmd.pack_command())
    }
}

public enum PubSubMessage: FromRedisValue {
    case message(channel: String, pattern: String?, payload: String)
    case subscribe(channel: String, number_of_channels: Int)
    case unsubscribe(channel: String, number_of_channels: Int)

    public init(_ value: RedisValue) throws {
        if case var .Array(array) = value {
            array = array.reversed()
            switch array.popLast() {
            case let .BulkString(message_type), let .SimpleString(message_type):
                switch message_type {
                case "message", "smessage":
                    if let channel_data = array.popLast() {
                        if let payload_data = array.popLast() {
                            self = try .message(channel: String(channel_data), pattern: nil, payload: String(payload_data))
                        }
                    }
                case "subscribe", "ssubscribe", "psubscribe":
                    if let channel_data = array.popLast() {
                        if let payload_data = array.popLast() {
                            self = try .message(channel: String(channel_data), pattern: nil, payload: String(payload_data))
                        }
                    }
                default:
                    break
                }
            default:
                break
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to PubSubMessage.")
    }
}
