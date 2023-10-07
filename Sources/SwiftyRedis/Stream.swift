//
//  Stream.swift
//
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

public typealias XreadResponse<T> = [RedisStream<T>] where T: FromRedisValue
public typealias XrangeResponse<T> = [RedisStreamElement<T>] where T: FromRedisValue

public struct RedisStreamElement<T>: FromRedisValue where T: FromRedisValue {
    public let id: String
    public let data: T

    public init(_ value: RedisValue) throws {
        if case var .Array(array) = value {
            array = array.reversed()
            if let id = try? String(array.popLast()) {
                self.id = id
                if let data = array.popLast() {
                    self.data = try T(data)
                    return
                }
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to RedisStreamElement.")
    }
}

public struct RedisStream<T>: FromRedisValue where T: FromRedisValue {
    public let name: String
    public let elements: [RedisStreamElement<T>]

    public init(_ value: RedisValue) throws {
        if case var .Array(array) = value {
            array = array.reversed()
            if let name = try? String(array.popLast()) {
                self.name = name
                if case let .Array(elements) = array.popLast() {
                    self.elements = try elements.map { value in try RedisStreamElement(value) }
                    return
                }
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to RedisStream.")
    }
}
