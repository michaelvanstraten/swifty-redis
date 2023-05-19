//
//  PubSub.swift
//
//
//  Created by Michael van Straten on 15.02.23.
//

import Foundation

public actor PubSubConnection {
    public typealias MessageStream = AsyncStream<Result<PubSubMessage, RedisError>>
    let con: RedisConnection
    var subscribers: [UUID: MessageStream.Continuation] = [:]
    var message_handler: Task<Void, Never>?

    internal init(con: RedisConnection) {
        self.con = con
    }

    func start_message_handler() {
        if message_handler != nil {
            return
        }

        message_handler = Task { [weak self] in
            guard let self = self else { return }

            while !Task.isCancelled {
                do {
                    let value = try await self.con.receive_response()
                    let pubsub_message = try PubSubMessage(value)
                    await self.subscribers.values.forEach { subscriber in
                        subscriber.yield(.success(pubsub_message))
                    }
                } catch let error as RedisError {
                    await self.subscribers.values.forEach { subscriber in
                        subscriber.yield(.failure(error))
                    }
                } catch {}
            }
        }
    }

    func add_subscriber(_ id: UUID, _ continuation: MessageStream.Continuation) {
        subscribers[id] = continuation
    }

    nonisolated func remove_subscriber(_ id: UUID) {
        Task {
            await self._remove_subscriber(id)
        }
    }

    func _remove_subscriber(_ id: UUID) {
        subscribers.removeValue(forKey: id)
    }

    public func messages() -> MessageStream {
        start_message_handler()

        let id = UUID()
        return AsyncStream { continuation in
            continuation.onTermination = { @Sendable _ in
                self.remove_subscriber(id)
            }

            self.add_subscriber(id, continuation)
        }
    }
}

public struct PubSubMessage: FromRedisValue {
    enum MessageType {
        case message(pattern: String?, payload: String)
        case subscribe(number_of_channels: Int)
        case unsubscribe(number_of_channels: Int)
    }
    
    var channel: String
    var type: MessageType

    public init(_ value: RedisValue) throws {
        if case var .Array(array) = value {
            array = array.reversed()
            let first_element = array.popLast()
            
            self.channel = try String(array.popLast())
            
            switch try String(first_element) {
            case "message", "pmessage", "smessage":
                let payload = try String(array.popLast())
   
                if let actual_payload = array.popLast() {
                    self.channel = payload
                    self.type = .message(pattern: self.channel, payload: try String(actual_payload))
                } else {
                    self.type = .message(pattern: nil, payload: payload)
                }
            case "subscribe", "psubscribe", "ssubscribe":
                self.type = .subscribe(number_of_channels: try Int(array.popLast()))
            case "unsubscribe", "punsubscribe", "sunsubscribe":
                self.type = .unsubscribe(number_of_channels: try Int(array.popLast()))
            default:
                throw RedisError.make_invalid_type_error(detail: "Unexprected message type")
            }
        } else {
            throw RedisError.make_invalid_type_error(detail: "Response type not convertible to PubSubMessage.")
        }
    }
}

extension PubSubConnection {
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
