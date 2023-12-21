//
//  PubSubConnectionTests.swift
//  SwiftyRedis
//
//  Created by Michael van Straten on 20.05.2023.
//

import Network
@testable import SwiftyRedis
import XCTest

final class PubSubConnectionTests: XCTestCase {
    let client = RedisClient.LOCAL

    func testPubSubConnection() async throws {
        let connection = try await client.get_connection()

        let pubSubConnection = try await client.get_pub_sub_connection()

        // Subscribe to a channel
        try await pubSubConnection.subscribe("channel1")

        // Publish a message to the channel
        Task {
            try await Task.sleep(nanoseconds: UInt64(1 * Double(NSEC_PER_SEC)))
            try await connection.publish("channel1", "Hello, World!")
        }

        // Receive the message from the PubSubConnection's message stream
        var messages = await pubSubConnection.messages().makeAsyncIterator()
        // Ignore `subscribe` message
        let _ = await messages.next()
        if let result = await messages.next() {
            switch result {
            case let .success(message):
                XCTAssertEqual(message.channel, "channel1")
                XCTAssertEqual(message.type, .message(pattern: nil, payload: Data("Hello, World!".utf8)))
            case let .failure(error):
                XCTFail("Received error: \(error)")
            }
        } else {
            XCTFail("Failed to receive message")
        }

        // Unsubscribe from the channel
        try await pubSubConnection.unsubscribe("channel1")
    }

    func testPubSubMessageParsing() throws {
        // Create a sample RedisValue representing a Pub/Sub message
        let redisValue: RedisValue = .Array([
            .BulkString("message"),
            .BulkString("channel1"),
            .BulkString("Hello, World!"),
        ])

        // Parse the RedisValue into a PubSubMessage
        let pubSubMessage = try PubSubMessage(redisValue)

        // Verify the parsed PubSubMessage properties
        XCTAssertEqual(pubSubMessage.channel, "channel1")
        XCTAssertEqual(pubSubMessage.type, .message(pattern: nil, payload: Data("Hello, World!".utf8)))
    }
}
