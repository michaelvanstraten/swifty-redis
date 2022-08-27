/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
FromRedisValue for custom types
*/

import Foundation

public struct RedisStreamElement<T> {
    public let id: String
    public let data: T
}
