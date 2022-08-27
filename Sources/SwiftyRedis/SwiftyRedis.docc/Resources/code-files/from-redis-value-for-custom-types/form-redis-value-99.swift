/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
A view to customize a sloth.
*/

import Foundation
import SwiftyRedis

public struct RedisStreamElement<T>: FromRedisValue where T: FromRedisValue {
    public let id: String
    public let data: T
}
