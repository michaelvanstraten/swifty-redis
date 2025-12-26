//
//  Value.swift
//
//
//  Created by Michael Van straten on 06.07.22.
//

import Foundation

/**
 The RESPType enum represents the fundamental data types in the Redis Serialization Protocol (RESP).
 
 This enum maps directly to the RESP protocol specification and is used for serialization and deserialization
 of Redis commands and responses. Each case corresponds to a specific RESP type as defined in the protocol.
 
 Note that Error values are not returned as RESPType values - the corresponding function throws a ``RedisError``
 in the case one is returned from Redis.
 */
public indirect enum RESPType: Equatable {
    /// Represents non-binary safe strings with minimal overhead. Typically used for successful command replies.
    /// Example: "+OK\r\n"
    case SimpleString(String)
    /// Represents integer responses from the server. The returned integer is guaranteed to be within the range of a signed 64-bit integer.
    /// Example: ":1000\r\n"
    case Int(Int64)
    /// Represents a single binary-safe string up to 512 MB in length.
    /// Example: "$5\r\nhello\r\n"
    case BulkString(Data)
    /// Represents the absence of a value.
    /// Example: "$-1\r\n" (RESP2) or "_\r\n" (RESP3)
    case Nil
    /// Represents an array of RESPType values, commonly used for commands that return collections of elements.
    /// Example: "*2\r\n$5\r\nhello\r\n$5\r\nworld\r\n"
    case Array([RESPType])
    
    static func BulkString(_ string: String) -> Self {
        return .BulkString(string.data(using: .utf8)!)
    }
}
