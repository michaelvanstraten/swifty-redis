//
//  Transaction.swift
//
//
//  Created by Michael van Straten on 24.11.22.
//

import Foundation

public func transaction(con: RedisConnection, keys: String..., f: (RedisConnection, RedisPipeline) async throws -> Optional<RedisValue>) async throws -> RedisValue {
    while true {
        try await Cmd("WATCH").arg(keys).exec(con);
        
        let pipe = RedisPipeline();
        
        if let response = try await f(con, pipe) {
            try await con.unwatch();
            return response
        }
    }
}
