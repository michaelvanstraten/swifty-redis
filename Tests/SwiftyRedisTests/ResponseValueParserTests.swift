//
//  ResponseParserTests.swift
//  SwiftyRedis
//
//  Created by Michael Van straten on 12.07.22.
//

import Network
import XCTest
@testable import SwiftyRedis

final class ResponseParserTests: XCTestCase {
    func test_simple_string() async throws {
        let value = try await "+OK\r\n".parseRedisValue()
        
        XCTAssertEqual(
            value,
            .SimpleString("OK")
        )
    }
    
    func test_errors() async throws {
        do {
            _ = try await "-ERR unknown command 'helloworld'\r\n".parseRedisValue()
        } catch  {
            XCTAssertEqual(
                RedisError.WithDescriptionAndDetail(
                    .ResponseError,
                    "An error was signalled by the server",
                    "unknown command 'helloworld'"
                ),
                error as! RedisError
            )
        }
    }
    
    func test_integers() async throws {
        let value = try await ":420\r\n".parseRedisValue()
        
        XCTAssertEqual(
            value,
            .Int(420)
        )
    }
    
    func test_bulk_strings() async throws {
        let value = try await "$5\r\nhello\r\n".parseRedisValue()
        XCTAssertEqual(
            value,
            .BulkString("hello")
        )
    }
    
    func test_arrays() async throws {
        let value = try await "*2\r\n$5\r\nhello\r\n$5\r\nworld\r\n".parseRedisValue()
        XCTAssertEqual(
            value,
            .Array([.BulkString("hello"), .BulkString("world")])
        )
    }
    
    func test_null_elements_in_arrays() async throws {
        let value = try await "*3\r\n$5\r\nhello\r\n$-1\r\n$5\r\nworld\r\n".parseRedisValue()
        
        XCTAssertEqual(
            value,
            .Array([.BulkString("hello"), .Nil, .BulkString("world")])
        )
    }
}

private extension String {
    func parseRedisValue() async throws -> RedisValue  {
        let dummyStream = AsyncDataStream.init(finalData: self.data(using: .utf8)!)
        
        let parser = ResponseValueParser(parse: dummyStream)
        return try await parser.parse_value()
    }
}

private extension AsyncDataStream {
    init(finalData: Data) {
        let dummyConnection = NWConnection.init(host: .name("DummyConnection", .none), port: .any, using: .tls)
        self.init(con: dummyConnection)
        self.buffer = finalData
    }
}
