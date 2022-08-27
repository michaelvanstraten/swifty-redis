/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Connecting to redis
*/

import Foundation
import SwiftyRedis

let client = RedisClient(
    .init("redis.mydomain.example"),
    port: .init(integerLiteral: 1234),
    params: .tcp,
    database: 3,
    username: "user",
    password: "super-secure-password"
)
