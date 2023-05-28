//
//  ResponseParser.swift
//
//
//  Created by Michael Van straten on 12.07.22.
//

import Foundation

class ResponseValueParser<I> where I: AsyncSequence, I.Element == UInt8 {
    private var iterator: I.AsyncIterator

    init(parse toParseStream: I.AsyncIterator) where I: AsyncSequence {
        iterator = toParseStream
    }

    func parse_value() async throws -> RedisValue {
        if let firstByte = try await iterator.next() {
            switch firstByte {
            case RedisRESP.SimpleString:
                return .SimpleString(try await parse_next_line())
            case RedisRESP.BulkString:
                return try await parse_bulk_string()
            case RedisRESP.Int:
                return try await parse_int()
            case RedisRESP.Array:
                return try await parse_array()
            case RedisRESP.Error:
                throw try await parse_error()
            default:
                break
            }
        }
        throw RedisError.InvalidResponse
    }

    func parse_next_line() async throws -> String {
        if let line = String(data: try await iterator.popUntilCRLF(), encoding: .utf8) {
            try await disgard_crlf_token()
            return line
        } else {
            throw RedisError.InvalidUTF8
        }
    }

    func parse_error() async throws -> RedisError {
        if let error = String(data: try await iterator.popUntilCRLF(), encoding: .utf8) {
            return RedisError(parse: error)
        } else {
            throw RedisError.InvalidResponse
        }
    }

    func parse_int() async throws -> RedisValue {
        if let value = try await Int64(parse_next_line()) {
            return .Int(value)
        } else {
            throw RedisError.WithDescription(.TypeError, "Expected integer, got garbage")
        }
    }

    func parse_bulk_string() async throws -> RedisValue {
        if case let .Int(length) = try await parse_int() {
            if length < 0 {
                return .Nil
            } else {
                if let value = String(data: try await iterator.popN(count: length), encoding: .utf8) {
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

    func parse_array() async throws -> RedisValue {
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

    @discardableResult
    func disgard_crlf_token() async throws -> Data {
        let disgarded_value = try await (1 ... RedisRESP.CRLF.count).mapAsync { _ in try await iterator.next()}.compactMap { $0 }
        return Data(disgarded_value)
    }
}

extension AsyncIteratorProtocol where Element == UInt8 {
    mutating func popN(count: Int64) async throws -> Data {
        if count <= 0 {
            return Data()
        } else {
            return try await Data((1 ... count).mapAsync ({ _ in try await self.next() }).compactMap ({ $0 }))
        }
    }
    
    mutating func popUntilCRLF() async throws -> Data {
        var poppedData = Data()
        
        while poppedData.suffix(RedisRESP.CRLF.count) != RedisRESP.CRLF {
            poppedData.append(try await self.next()!)
        }
        
        return poppedData
    }
}

// https://github.com/nvzqz/Unreachable/blob/master/Sources/Unreachable.swift
@inline(__always)
func unreachable() -> Never {
    return unsafeBitCast((), to: Never.self)
}

extension Sequence {
    func mapAsync<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
