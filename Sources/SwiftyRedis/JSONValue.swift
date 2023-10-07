//
//  File.swift
//
//
//  Created by Michael van Straten on 02.05.23.
//

import Foundation

/**
 A generic wrapper struct for storing JSON values retrieved from Redis.

 Use this struct to encapsulate JSON values fetched from Redis and decode them into Swift types.

 Example usage:
 ```swift
 let redisValue: RedisValue = ... // Retrieve a Redis value
 let jsonValue = try JSONValue<MyType>(redisValue) // Convert Redis value to JSONValue
 let decodedValue = jsonValue.value // Access the decoded value
 ```

 - Note: This struct assumes that the stored JSON value can be successfully decoded into the specified type `T` using `JSONDecoder`.
 - Important: This struct implements the ``FromRedisValue`` protocol for automatic conversion from ``RedisValue`` to ``JSONValue`` when decoding JSON values from Redis. Ensure that the type `T` conforms to `Decodable` to enable successful decoding.
 - Requires: Swift 4 (or newer)
 - Warning: If the Redis value is not a bulk string, a ``RedisError`` will be thrown with an invalid type error message.
 - SeeAlso: ``FromRedisValue``, ``RedisValue``, ``RedisError``
 */
public struct JSONValue<T> {
    /// The decoded value of type `T`.
    public let value: T
}

extension JSONValue: FromRedisValue where T: Decodable {
    /**
     Initializes a ``JSONValue`` by decoding a Redis value into a specified type.

     - Parameter value: The Redis value to decode.
     - Throws: ``RedisError`` if the Redis value is not a bulk string or if decoding fails.
     */
    public init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(data):
            let decoder = JSONDecoder()
            self.value = try decoder.decode(T.self, from: data)
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type (\(value)), is not JSON compatible")
        }
    }
}
