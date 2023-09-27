//
//  TransactionTests.swift
//  
//
//  Created by Michael van Straten on 27.09.23.
//

import Network
@testable import SwiftyRedis
import XCTest

final class TransactionTests: XCTestCase {
    let client = RedisClient.LOCAL

    func test_highlevel_transaction() async throws {
        let con = try await client.get_connection()
        
        let key = "foo"
        
        try await con.set(key, "42")
        
        let response: RedisValue = try await transaction(con: con, keys: key) { con, pipeline in
            let value: Int = try await con.get(key);
            
            return try await pipeline.cmd("SET").arg(key).arg(value + 1).get(key).query(con)
        }
        
        XCTAssertEqual(response, RedisValue.Array([RedisValue.SimpleString("OK"), RedisValue.BulkString("43")]))
    }
}
