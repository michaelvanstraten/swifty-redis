//
//  Value.swift
//
//
//  Created by Michael Van straten on 06.07.22.
//

import Foundation

/**
 The RedisValue enum represents different types of values parsed from a Redis reply.

 Note that Error values are not returned, the corresponding function throws a ``RedisError`` in the case one is returned from redis.
 */
public indirect enum RedisValue: Equatable {
    /// Represents non-binary safe strings with minimal overhead. Typically used for successful command replies. For example, many Redis commands reply with just "OK.
    case SimpleString(String)
    /// Represents integer responses from the server. The returned integer is guaranteed to be within the range of a signed 64-bit integer.
    case Int(Int64)
    /// Represents a single binary-safe string up to 512 MB in length.
    case BulkString(String)
    /// Represents the absence of a value.
    case Nil
    /// Represents an array of RedisValues, commonly used for commands that return collections of elements.
    case Array([RedisValue])
}
