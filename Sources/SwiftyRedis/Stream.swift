//
//  Stream.swift
//  
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

public typealias XreadResponse<T> = Array<RedisStream<T>> where T: FromRedisValue
public typealias XrangeResponse<T> = Array<RedisStreamElement<T>> where T: FromRedisValue

public struct RedisStreamElement<T>: FromRedisValue where T: FromRedisValue {
    public let id: String
    public let data: T
    
    public init(_ value: RedisValue) throws {
        if case .Array(var array) = value {
            array = array.reversed()
            switch array.popLast() {
            case .BulkString(let id), .SimpleString(let id):
                self.id = id
                if let data = array.popLast() {
                    self.data = try T.init(data)
                    return
                }
            default:
                break
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to RedisStreamElement.")
    }
}

public struct RedisStream<T>: FromRedisValue where T: FromRedisValue {
    public let name: String
    public let elements: Array<RedisStreamElement<T>>
    
    public init(_ value: RedisValue) throws {
        if case .Array(var array) = value {
            array = array.reversed()
            switch array.popLast() {
            case .BulkString(let name), .SimpleString(let name):
                self.name = name
                if case .Array(let elements) = array.popLast() {
                    self.elements = try elements.map({value in try RedisStreamElement(value)})
                    return
                }
            default:
                break
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to RedisStream.")
    }
}
