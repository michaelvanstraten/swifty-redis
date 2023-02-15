//
//  ConnectionTests.swift
//  SwiftyRedis
//
//  Created by Michael Van straten on 13.07.22.
//

import Network
import XCTest
@testable import SwiftyRedis

final class ConnectionTests: XCTestCase {
    let client = RedisClient.LOCAL
    
    func testSimple() async throws {
        let connection = try await client.get_connection()
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
        
        let value: XreadResponse<RedisValue> = try await connection.xread(nil, 0, .init("testStream", id: "$"))
        
        print(value)
    }
    
    func test_georadius() async throws {
        let connection = try await client.get_connection()
        let count: Int = try await connection.geoadd("Sincily", nil, .init(13.361389, 38.115556, "Palermo"), .init(15.087269,  37.502669, "Catania"))
        print(count)
        let search: RedisValue = try await connection.geosearch("Sincily", .FROMLONLAT(.init(13, 38)), .BOX(.init(1000, 1000, .km)), .ASC, .init(2, []), [.WITHCOORD])
        print(search)
    }
}
