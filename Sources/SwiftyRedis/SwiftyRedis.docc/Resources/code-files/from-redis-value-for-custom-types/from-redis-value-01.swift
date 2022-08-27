/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
FromRedisValue for custom types
*/

import Foundation
import SwiftyRedis

public struct RedisStreamElement<T>: FromRedisValue {
    public let id: String
    public let data: T
}
