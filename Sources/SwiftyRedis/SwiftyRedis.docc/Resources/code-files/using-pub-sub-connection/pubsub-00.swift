//
//  Using a PubSubConnection
//

import Foundation

// Create a Redis client
let client = RedisClient(
    .init("redis.mydomain.example"),
    port: .init(integerLiteral: 1234),
    params: .tcp
)

