//
//  PubSub.swift
//  
//
//  Created by Michael van Straten on 15.02.23.
//

import Foundation

public enum PubSubMessage: FromRedisValue {
    case message(channel: String, pattern: String?, payload: String)
    case subscribe(channel: String, number_of_channels: Int)
    case unsubscribe(channel: String, number_of_channels: Int)
    
    public init(_ value: RedisValue) throws {
        if case .Array(var array) = value {
            array = array.reversed()
            switch array.popLast() {
            case .BulkString(let message_type), .SimpleString(let message_type):
                switch message_type {
                case "message", "smessage":
                    if let channel_data = array.popLast() {
                        if let payload_data = array.popLast() {
                            self = .message(channel: try String(channel_data), pattern: nil, payload: try String(payload_data))
                        }
                    }
                case "subscribe", "ssubscribe", "psubscribe":
                    if let channel_data = array.popLast() {
                        if let payload_data = array.popLast() {
                            self = .message(channel: try String(channel_data), pattern: nil, payload: try String(payload_data))
                        }
                    }
                default:
                    break
                }
            default:
                break
            }
        }
        throw RedisError.make_invalid_type_error(detail: "Response type not convertible to PubSubMessage.")
    }
}
