//
//  File.swift
//
//
//  Created by Michael van Straten on 02.05.23.
//

import Foundation

struct JSONValue<T> {
    let value: T
}

extension JSONValue: FromRedisValue where T: Decodable {
    internal init(_ value: RedisValue) throws {
        switch value {
        case let .BulkString(string):
            let decoder = JSONDecoder()
            self.value = try decoder.decode(T.self, from: string.data(using: .utf8)!)
        default:
            throw RedisError.make_invalid_type_error(detail: "Response type json value")
        }
    }
}
