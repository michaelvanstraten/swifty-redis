//
//  ProtocolSpec.swift
//
//
//  Created by Michael Van straten on 12.07.22.
//

import Foundation

/// Swift representation of [Redis serialization protocol](1) constants.
///
/// [1]:  https://redis.io/docs/reference/protocol-spec/#resp-protocol-description
internal enum RESPConstants {
    // MARK: - RESP2 Types
    /// The CRLF (Carriage Return and Line Feed) sequence used to terminate different parts of the protocol.
    static let CRLF: [UInt8] = [.init(ascii: "\r"), .init(ascii: "\n")]
    /// First byte of a Simple String in RESP protocol.
    static let SimpleString: UInt8 = .init(ascii: "+")
    /// First byte of a Simple Error in RESP protocol.
    static let SimpleError: UInt8 = .init(ascii: "-")
    /// First byte of an Integer in RESP protocol.
    static let Integer: UInt8 = .init(ascii: ":")
    /// First byte of a Bulk String in RESP protocol.
    static let BulkString: UInt8 = .init(ascii: "$")
    /// First byte of an Array in RESP protocol.
    static let Array: UInt8 = .init(ascii: "*")
    // MARK: - RESP3 Types
    /// First byte of a Null in RESP3 protocol.
    static let Null: UInt8 = .init(ascii: "_")
    /// First byte of a Boolean in RESP3 protocol.
    static let Boolean: UInt8 = .init(ascii: "#")
    /// First byte of a Double in RESP3 protocol.
    static let Double: UInt8 = .init(ascii: ",")
    /// First byte of a Big Number in RESP3 protocol.
    static let BigNumber: UInt8 = .init(ascii: "(")
    /// First byte of a Bulk Error in RESP3 protocol.
    static let BulkError: UInt8 = .init(ascii: "!")
    /// First byte of a Verbatim String in RESP3 protocol.
    static let VerbatimString: UInt8 = .init(ascii: "=")
    /// First byte of a Map in RESP3 protocol.
    static let Map: UInt8 = .init(ascii: "%")
    /// First byte of an Attribute in RESP3 protocol.
    static let Attribute: UInt8 = .init(ascii: "|")
    /// First byte of a Set in RESP3 protocol.
    static let Set: UInt8 = .init(ascii: "~")
    /// First byte of a Push in RESP3 protocol.
    static let Push: UInt8 = .init(ascii: ">")
}
