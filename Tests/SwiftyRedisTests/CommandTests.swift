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
        try await connection.acl_setuser("virginia", "on", "+GET", "allkeys", "(+SET ~app2*)").exec()
        let user_info: RedisValue = try await connection.acl_getuser("virginia").query()
        print(user_info)
    }
    
    func test_memory_stats() async throws {
        let connection = try await client.get_connection()
        let memory_stats: RedisValue = try await connection.memory_stats().query()
        print(memory_stats)
    }
    
    func test_pipeline() async throws {
        let connection = try await client.get_connection()
        try await RedisPipeline()
            .hset("hash", .init("field1", "Hello"), .init("field2", "world"))
            .exec(connection)
    }
    
//    func test_georadius() async throws {
//        let connection = try await client.get_connection()
//        let count: Int = try await connection.geoadd("Sincily", .init(longitude: 13.361389, latitude: 38.115556, member: "Palermo"), .init(longitude: 15.087269, latitude: 37.502669, member: "Catania"))
//        print(count)
//        let search: RedisValue = try await connection.geosearch("Sicily", .FROMLONLAT(.init(longitude: 13, latitude: 38)), .BOX(.init(width: 1000, height: 1000, unit: .km)), .ASC, .init(count: 2, options: []), [.WITHCOORD])
//        print(search)
//    }
}
