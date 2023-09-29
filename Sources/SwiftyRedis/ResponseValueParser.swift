//
//  ResponseParser.swift
//
//
//  Created by Michael Van straten on 12.07.22.
//

import Foundation
@_spi(AsyncChannel) import NIOCore

/**
 The ResponseValueParser class is responsible for parsing Redis server responses.
 */
class ResponseValueParser {
    private var stream: AsyncDataStream

    /**
     Initializes a new instance of `ResponseValueParser` with the specified parse stream.

     - Parameter toParseStream: The `AsyncDataStream` to parse.
     */
    init(parse streamToParse: AsyncDataStream) {
        stream = streamToParse
    }

    /**
     Parses the next Redis value from the stream asynchronously.

     - Returns: The parsed `RedisValue`.
     - Throws: An error of type `RedisError` if there is an error during parsing.
     */
    func parse_value() async throws -> RedisValue {
        let firstByte = try await stream.next()
        switch firstByte {
        case RedisRESP.SimpleString:
            return try .SimpleString(await parse_next_line())
        case RedisRESP.BulkString:
            return try await parse_bulk_string()
        case RedisRESP.Int:
            return try await parse_int()
        case RedisRESP.Array:
            return try await parse_array()
        case RedisRESP.Error:
            throw try RedisError(parse: await parse_next_line())
        default:
            throw RedisError.InvalidResponse
        }
    }

    /**
     Parses the next line from the stream asynchronously.

     - Returns: The parsed line as a `String`.
     - Throws: An error of type `RedisError` if there is an error during parsing or if the UTF-8 encoding is invalid.
     */
    private func parse_next_line() async throws -> String {
        if let line = try String(data: await stream.nextUntil(subsequence: RedisRESP.CRLF), encoding: .utf8) {
            try await disgard_crlf_token()
            return line
        } else {
            throw RedisError.InvalidUTF8
        }
    }

    /**
     Parses the next integer value from the stream asynchronously.

     - Returns: The parsed integer value as a `RedisValue`.
     - Throws: An error of type `RedisError` if there is an error during parsing or if the parsed value is not an integer.
     */
    private func parse_int() async throws -> RedisValue {
        if let value = try await Int64(parse_next_line()) {
            return .Int(value)
        } else {
            throw RedisError.WithDescription(.TypeError, "Expected integer, got garbage")
        }
    }

    /**
     Parses the next bulk string value from the stream asynchronously.

     - Returns: The parsed bulk string value as a `RedisValue`.
     - Throws: An error of type `RedisError` if there is an error during parsing or if the UTF-8 encoding is invalid.
     */
    private func parse_bulk_string() async throws -> RedisValue {
        if case let .Int(length) = try await parse_int() {
            if length < 0 {
                return .Nil
            } else {
                if let value = try String(data: await stream.next(n: Int(length)), encoding: .utf8) {
                    try await disgard_crlf_token()
                    return .BulkString(value)
                } else {
                    throw RedisError.InvalidUTF8
                }
            }
        } else {
            unreachable()
        }
    }

    /**
     Parses the next array value from the stream asynchronously.

     - Returns: The parsed array value as a `RedisValue`.
     - Throws: An error of type `RedisError` if there is an error during parsing.
     */
    private func parse_array() async throws -> RedisValue {
        if case let .Int(length) = try await parse_int() {
            if length < 0 {
                return .Nil
            } else if length == 0 {
                return .Array([])
            } else {
                return try await .Array((1 ... length).mapAsync { _ in try await parse_value() })
            }
        } else {
            unreachable()
        }
    }

    /**
     Discards the CRLF token from the stream asynchronously.

     - Returns: The discarded data as a `Data` object.
     - Throws: An error of type `RedisError` if there is an error during discarding the token.
     */
    @discardableResult
    private func disgard_crlf_token() async throws -> Data {
        let disgarded_value = try await stream.next(n: RedisRESP.CRLF.count)
        return Data(disgarded_value)
    }
}

/**
 Unreachable.swift - https://github.com/nvzqz/Unreachable/blob/master/Sources/Unreachable.swift

 Utility function to mark code paths as unreachable.

 - Returns: A Never value.
 - Note: This function is used internally and should not be called directly.
  */
@inline(__always)
func unreachable() -> Never {
    return unsafeBitCast((), to: Never.self)
}
