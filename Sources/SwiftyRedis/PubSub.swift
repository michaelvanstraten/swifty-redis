//
//  PubSub.swift
//
//
//  Created by Michael van Straten on 15.02.23.
//

import Foundation

/**
 A PubSubConnection is an object that represents a single redis connection,
 on which only PubSub commands can be executed.

 For more information on how to use this class, refer to <doc:UsingPubSubConnection>.
 */
public actor PubSubConnection {
    /// Represents a stream of `PubSubMessage` or `RedisError` results.
    public typealias MessageStream = AsyncStream<Result<PubSubMessage, RedisError>>

    /// The underlying Redis connection.
    let con: RedisConnection

    /// A dictionary that maps subscriber IDs to their corresponding message stream continuations.
    var subscribers: [UUID: MessageStream.Continuation] = [:]

    /// A task that handles incoming messages from the Redis connection.
    var message_handler: Task<Void, Never>?

    /**
     Initializes a new `PubSubConnection` instance with the given Redis connection.

     - Parameter con: The Redis connection to be associated with the `PubSubConnection`.
     */
    internal init(con: RedisConnection) {
        self.con = con
    }

    /**
     Starts the message handler task, which continuously listens for incoming messages from the Redis connection
     and notifies the subscribers accordingly.
     */
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

    /**
     Adds a new subscriber to the `PubSubConnection` with the specified ID and message stream continuation.

     - Parameters:
       - id: The ID of the subscriber.
       - continuation: The message stream continuation associated with the subscriber.
     */
    func add_subscriber(_ id: UUID, _ continuation: MessageStream.Continuation) {
        subscribers[id] = continuation
    }

    /**
     Removes a subscriber from the `PubSubConnection` using a nonisolated interface.

     - Parameter id: The ID of the subscriber to be removed.
     */
    nonisolated func remove_subscriber(_ id: UUID) {
        Task {
            await self._remove_subscriber(id)
        }
    }

    /**
     Actually removes the subscriber from the `PubSubConnection`.

     - Parameter id: The ID of the subscriber to be removed.
     */
    func _remove_subscriber(_ id: UUID) {
        subscribers.removeValue(forKey: id)
    }

    /**
     Returns a message stream that emits `PubSubMessage` or `RedisError` results.

     This method starts the message handler task if it hasn't been started yet and associates a unique ID with the subscriber.
     The subscriber is automatically removed when the stream is terminated or dropped.

     - Returns: A message stream for receiving `PubSubMessage` or `RedisError` results.
     */
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

/**
 This struct represents a parsed Pub/Sub message.
 */
public struct PubSubMessage: FromRedisValue {
    /**
     The type of the Redis pub/sub message.
     */
    public enum MessageType: Equatable {
        /**
         Indicates a message received as a result of a `PUBLISH` command issued by another client.
         The `pattern` parameter represents the pattern of the channel if it was a pattern subscription,
         otherwise it's `nil`. The payload parameter represents the actual message payload.
         */
        case message(pattern: String?, payload: Data)
        /**
         Indicates that we successfully subscribed to a channel.
         The `number_of_channels` parameter represents the total number of channels we are currently subscribed to.
         */
        case subscribe(number_of_channels: Int)
        /**
         Indicates that we successfully unsubscribed from a channel.
         The `number_of_channels` parameter represents the total number of channels we are currently subscribed to.
         */
        case unsubscribe(number_of_channels: Int)
    }

    /// The associated channel name of the pub/sub message.
    public var channel: String
    /// The type of the pub/sub message.
    public var type: MessageType

    /**
     Initializes a PubSubMessage struct from a RedisValue.
     - Parameter value: The RedisValue representing the Pub/Sub message.
     - Throws: An error if the RedisValue is not convertible to PubSubMessage
     */
    public init(_ value: RedisValue) throws {
        if case var .Array(array) = value {
            array = array.reversed()
            let message_type = try String(array.popLast())


            switch message_type {
            case "message", "smessage":
                channel = try String(array.popLast())
                if case .BulkString(let data) = array.popLast() {
                    type = .message(pattern: nil, payload: data)
                } else {
                    throw RedisError.make_invalid_type_error(detail: "Response type (\(value)) is not convertible to PubSubMessage")
                }
            case "pmessage":
                let pattern = try String(array.popLast())
                channel = try String(array.popLast())
                
                let actual_payload_data: Data
                if case .BulkString(let data) = array.popLast() {
                    type = .message(pattern: pattern, payload: data)
                } else {
                    throw RedisError.make_invalid_type_error(detail: "Response type (\(value)) is not convertible to PubSubMessage")
                }
            case "subscribe", "psubscribe", "ssubscribe":
                channel = try String(array.popLast())
                type = try .subscribe(number_of_channels: Int(array.popLast()))
            case "unsubscribe", "punsubscribe", "sunsubscribe":
                channel = try String(array.popLast())
                type = try .unsubscribe(number_of_channels: Int(array.popLast()))
            default:
                throw RedisError.make_invalid_type_error(detail: "Unexprected PubSubMessage type (\"\(message_type)\")")
            }
        } else {
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)) is not convertible to PubSubMessage")
        }
    }
}

public extension PubSubConnection {
    /// Listen for messages published to the given channels
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of channels to subscribe to.
    /// ## Documentation
    /// view the docs for [SUBSCRIBE](https://redis.io/commands/subscribe)
    func subscribe(_ channel: String...) async throws {
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
    func psubscribe(_ pattern: String...) async throws {
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
    func ssubscribe(_ shardchannel: String...) async throws {
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
    func unsubscribe(_ channel: String...) async throws {
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
    func punsubscribe(_ pattern: String...) async throws {
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
    func sunsubscribe(_ shardchannel: String...) async throws {
        let cmd = Cmd("SUNSUBSCRIBE").arg(shardchannel)
        try await con.send_packed_command(cmd.pack_command())
    }
}
