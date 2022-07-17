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
    let client = RedisClient.LOCALHOST
    
    func testSimple() async throws {
        let connection = try await client.get_connection()
        let status: String = try await connection.acl_setuser(username: "virginia", rule: "on", "+GET", "allkeys", "(+SET ~app2*)")
        print(status)
        let user_info: RedisValue = try await connection.acl_getuser(username: "virginia")
        print( user_info)
    }
    
    func test_memory_stats() async throws {
        let connection = try await client.get_connection()
        let memory_stats: RedisValue = try await connection.memory_stats()
        print(memory_stats)
    }
}
