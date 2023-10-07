//
//  FromRedisValue.swift
//
//
//  Created by Michael Van straten on 11.07.22.
//

import Foundation

/**
 The `FromRedisValue` protocol is used to convert a Redis value into a more appropriate Swift type.

 ## Overview

 The `FromRedisValue` protocol is designed to handle the conversion of a ``RedisValue`` (which can represent any response from a Redis server)
 into a Swift type that is more suitable for further processing. For example, you may want to convert the Redis value into a `String` or an integer.

 This protocol is widely supported throughout the package, and you can implement it for your own custom types if needed.
 */
public protocol FromRedisValue {
    /**
     Initializes an instance of the conforming type using a `RedisValue` parameter.

     - Parameter value: The `RedisValue` to convert into the desired destination type.
     - Throws: An error if the conversion fails due to incompatibility with the destination type.
     */
    init(_ value: RedisValue) throws
}

extension FromRedisValue {
    init(_ optinal_value: RedisValue?) throws {
        guard let value = optinal_value else {
            throw RedisError.make_invalid_type_error(detail: "Can not convert nil RedisValue to \(Self.Type.self)")
        }
        self = try .init(value)
    }
}

extension String: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .SimpleString(string):
            self = string
        case let .BulkString(data):
            guard let string = String(data: data, encoding: .utf8) else {
                throw RedisError.InvalidUTF8
            }
            self = string
        case let .Int(int):
            self = "\(int)"
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not String compatible")
        }
    }
}

extension Float64: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(data):
            if let string = String(data: data, encoding: .utf8) {
                self = try Self.init(RedisValue.SimpleString(string))
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert non UTF-8 String to Float64")
            }
        case let .SimpleString(string):
            if let float = Float64(string) {
                self = float
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert String (\"\(string)\") to Float64")
            }
        case let .Int(int):
            self = Float64(int)
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not Float64 compatible")
        }
    }
}

extension Float32: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(data):
            if let string = String(data: data, encoding: .utf8) {
                self = try Self.init(RedisValue.SimpleString(string))
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert non UTF-8 String to Float32")
            }
        case let .SimpleString(string):
            if let float = Float(string) {
                self = float
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert String (\"\(string)\") to Float32")
            }
        case let .Int(int):
            self = Float32(int)
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not Float32 compatible")
        }
    }
}

#if arch(arm64)
    @available(watchOS 7.0, *)
    @available(tvOS 14.0, *)
    @available(iOS 14.0, *)
    @available(macOS 11.0, *)
    extension Float16: FromRedisValue {
        public init(_ value: RedisValue) throws {
            self = try Float16(Int(value))
        }
    }
#endif

extension Int64: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(data):
            if let string = String(data: data, encoding: .utf8) {
                self = try Self.init(RedisValue.SimpleString(string))
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert non UTF-8 String to Int64")
            }
        case let .SimpleString(string):
            if let int = Int64(string) {
                self = int
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert String (\"\(string)\") to Int64")
            }
        case let .Int(int):
            self = int
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not Int64 compatible")
        }
    }
}

extension Int: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try Int(Int64(value))
    }
}

extension Int32: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try Int32(Int(value))
    }
}

extension Int16: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try Int16(Int(value))
    }
}

extension UInt64: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try UInt64(Int(value))
    }
}

extension UInt32: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try UInt32(Int(value))
    }
}

extension UInt16: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try UInt16(Int(value))
    }
}

extension Array: FromRedisValue where Element: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .Array(array):
            self = try array.map { value in try Element(value) }
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not Array compatible")
        }
    }
}

extension Set: FromRedisValue where Element: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try Set(Array<Element>.init(value))
    }
}

extension Optional: FromRedisValue where Wrapped: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case .Nil:
            self = nil
        default:
            self = try Wrapped(value)
        }
    }
}

extension RedisValue: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = value
    }
}

extension Bool: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .Int(int):
            self = int != 0
        case let .BulkString(data):
            if let string = String(data: data, encoding: .utf8) {
                self = try Self.init(RedisValue.SimpleString(string))
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert non UTF-8 String to Bool")
            }
        case let .SimpleString(string):
            if string == "1" {
                self = true
            } else if string == "0" {
                self = false
            } else {
                throw RedisError.make_invalid_type_error(detail: "Could not convert String (\"\(string)\")) to Bool")
            }
        case .Nil:
            self = false
        case .Array:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not Bool compatible")
        }
    }
}
