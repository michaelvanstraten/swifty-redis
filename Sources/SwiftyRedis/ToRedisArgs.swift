//
//  ToRedisArgs.swift
//
//
//  Created by Michael Van straten on 05.07.22.
//

import Foundation

/**
 Used to convert a value into one or multiple Redis argument strings.
 */
public protocol ToRedisArgs {
    /**
     Writes the value into an array of bytes. Each item represents a single Redis argument.
     Most items generate a single item. The exception to this rule currently are Arrays of items.

     - Parameters:
     - out: An inout parameter that represents the array of bytes.
     */
    func write_redis_args(out: inout [Data])
}

public extension ToRedisArgs {
    /**
     Converts the value into an array of bytes. Each item represents a single Redis argument.
     Most items generate a single item. The exception to this rule currently are Arrays of items.

     - Returns: An array of bytes representing the Redis arguments.
     */
    func to_redis_args() -> [Data] {
        var data: [Data] = Array()
        write_redis_args(out: &data)
        return data
    }
}

extension String: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        if let data = data(using: .utf8) {
            out.append(data)
        }
    }
}

extension Array: ToRedisArgs where Element: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        for element in self {
            element.write_redis_args(out: &out)
        }
    }
}

extension Int: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        out.append(String(self).data(using: .utf8)!)
    }
}

extension Int64: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        out.append(String(self).data(using: .utf8)!)
    }
}

extension Double: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        out.append(String(self).data(using: .utf8)!)
    }
}

extension Optional: ToRedisArgs where Wrapped: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        if let some = self {
            some.write_redis_args(out: &out)
        }
    }
}

extension Data: ToRedisArgs {
    public func write_redis_args(out: inout [Data]) {
        out.append(self)
    }
}
