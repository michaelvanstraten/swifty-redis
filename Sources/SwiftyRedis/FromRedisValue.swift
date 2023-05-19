//
//  FromRedisValue.swift
//
//
//  Created by Michael Van straten on 11.07.22.
//

import Foundation

/**
 This Protocol is used to convert a redis value into a more appropriate
 type.

 ## Overview

 While a ``RedisValue`` can represent any response that comes
 back from the redis server, usually you want to map this into something
 that works better in swift. For instance you might want to convert the
 return value into a `String` or an integer.

 This Protocol is well supported throughout the package and you can
 implement it for your own types if you want.
 */
public protocol FromRedisValue {
    /// Given a ``RedisValue`` this attempts to convert it into the given
    /// destination type. If that fails because it's not compatible an
    /// appropriate error is generated.
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
        case let .SimpleString(string), let .BulkString(string):
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
        case let .BulkString(string), let .SimpleString(string):
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
        case let .BulkString(string), let .SimpleString(string):
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

@available(watchOS 7.0, *)
@available(tvOS 14.0, *)
@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(macOS, unavailable)
extension Float16: FromRedisValue {
    public init(_ value: RedisValue) throws {
        self = try Float16(Int(value))
    }
}

extension Int64: FromRedisValue {
    public init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(string), let .SimpleString(string):
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
        case let .BulkString(string), let .SimpleString(string):
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
