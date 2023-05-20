//
//  ProtocolSpec.swift
//
//
//  Created by Michael Van straten on 12.07.22.
//

import Foundation

/**
 Swift representation of [RESP protocol description](https://redis.io/docs/reference/protocol-spec/#resp-protocol-description) constants.
 */
public enum RedisRESP {
    /// Represents the CRLF (Carriage Return and Line Feed) sequence used to terminate different parts of the protocol.
    public static let CRLF: [UInt8] = [13, 10]

    /// Represents the first byte of a Simple String in the RESP protocol, which is "+".
    public static let SimpleString: UInt8 = .init(ascii: "+")

    /// Represents the first byte of an Error in the RESP protocol, which is "-".
    public static let Error: UInt8 = .init(ascii: "-")

    /// Represents the first byte of an Integer in the RESP protocol, which is ":".
    public static let Int: UInt8 = .init(ascii: ":")

    /// Represents the first byte of a Bulk String in the RESP protocol, which is "$".
    public static let BulkString: UInt8 = .init(ascii: "$")

    /// Represents the first byte of an Array in the RESP protocol, which is "*".
    public static let Array: UInt8 = .init(ascii: "*")
}
