//
//  ConnectionTests.swift
//  SwiftyRedis
//
//  Created by Michael Van straten on 13.07.22.
//

@testable import SwiftyRedis
import NIO
import XCTest

final class ConnectionTests: XCTestCase {
    let client = RedisClient.LOCAL
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)

    func test_simple() async throws {
        let connection = try await client.get_connection(group: group )
        try await connection.acl_setuser("virginia", "on", "+GET", "allkeys", "(+SET ~app2*)")
        let user_info: RedisValue = try await connection.acl_getuser("virginia")
        print(user_info)
    }

    func test_memory_stats() async throws {
        let connection = try await client.get_connection()
        let memory_stats: RedisValue = try await connection.memory_stats()
        print(memory_stats)
    }

    func test_pipeline() async throws {
        let connection = try await client.get_connection()
        try await RedisPipeline()
            .hset("testhash", .init("field1", "Hello"), .init("field2", "world"))
            .exec(connection)
    }

    func test_xread() async throws {
        let connection = try await client.get_connection()

        // Add a message to the stream
        Task {
            let connection2 = try await client.get_connection()
            try await Task.sleep(nanoseconds: UInt64(1 * Double(NSEC_PER_SEC)))
            try await connection2.xadd("stream1", nil, .AUTO_ID, .init("field1", "Hello, World!"))
        }

        let value: RedisValue = try await connection.xread(nil, 0, .init("stream1", id: "$"))

        print(value)
    }

    func test_georadius() async throws {
        let connection = try await client.get_connection()
        let count: Int = try await connection.geoadd("Sincily", nil, .init(13.361389, 38.115556, "Palermo"), .init(15.087269, 37.502669, "Catania"))
        print(count)
        let search: RedisValue = try await connection.geosearch("Sincily", .FROMLONLAT(.init(13, 38)), .BOX(.init(1000, 1000, .KM)), .ASC, .init(2, []), [.WITHCOORD])
        print(search)
    }

    func test_json_64KB() async throws {
        let connection = try await client.get_connection()

        let json_data = try String(contentsOf: .init(string: "https://microsoftedge.github.io/Demos/json-dummy-data/64KB.json")!)

        try await connection.set("key1", json_data)
        let value: String = try await connection.get("key1")

        XCTAssertTrue(json_data == value)
    }

    func test_json_1MB() async throws {
        let connection = try await client.get_connection()

        let json_data = try String(contentsOf: .init(string: "https://microsoftedge.github.io/Demos/json-dummy-data/1MB.json")!)

        try await connection.set("key1", json_data)
        let value: String = try await connection.get("key1")

        XCTAssertTrue(json_data == value)
    }
}
