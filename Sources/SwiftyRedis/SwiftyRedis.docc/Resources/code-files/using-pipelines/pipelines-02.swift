/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Using pipelines
*/

import Foundation
import SwiftyRedis

RedisPipeline()
    .hset(
        key: "user::123",
        fieldValue:
                .init(field: "username", value: "testuser"),
                .init(field: "password", value: "hash123")
    )
    .sadd(key: "users", member: "123")
