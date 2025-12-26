//
//  RedisValueDecodeer.swift
//  SwiftyRedis
//
//  Created by Michael van Straten on 17.04.25.
//

import Foundation
import NIOCore

/**
 A decoder for the Redis Serialization Protocol (RESP).
 
 The decoder implements the RESP protocol specification as defined in the Redis documentation.
 It supports both RESP2 and RESP3 protocol versions and can decode all RESP data types.
 
 The decoder works by:
 1. Reading the first byte to determine the RESP type
 2. Selecting the appropriate decoder for that type
 3. Parsing the value according to the RESP specification
 4. Converting it into a Swift-native RESPType
 
 Example usage:
 ```swift
 let decoder = RESPDecoder()
 var buffer = ByteBuffer(string: "+OK\r\n")
 let value = try decoder.readOne(from: &buffer)
 // value will be .SimpleString("OK")
 ```
 */
internal struct RESPDecoder: ByteToMessageDecoder {
    typealias InboundOut = RESPType

    private var current: (any ByteToRESPDecoder)? = nil

    mutating func decode(
        context: ChannelHandlerContext,
        buffer: inout ByteBuffer
    ) throws -> DecodingState {
        guard let frame = try readOne(from: &buffer) else {
            return .needMoreData
        }
        context.fireChannelRead(wrapInboundOut(frame))
        return .continue
    }

    /// Reads a single RESP value from the buffer.
    /// - Parameter buf: The buffer to read from
    /// - Returns: The decoded RESP value, or nil if more data is needed
    mutating func readOne(from buf: inout ByteBuffer) throws -> RESPType? {
        // If we already have a decoder in flight, let it continue.
        if var active = current {
            if let resp = try active.decodeRESP(from: &buf) {
                current = nil  // finished
                return resp
            }
            current = active  // still waiting
            return nil
        }

        // Need a new decoder — first byte must be present.
        guard let tag: UInt8 = buf.readInteger() else { return nil }
        current = try selectDecoder(for: tag)
        // Tail‑call self to give the new decoder a chance immediately.
        return try readOne(from: &buf)
    }

    /// Selects the appropriate decoder based on the RESP type byte.
    private func selectDecoder(for tag: UInt8) throws -> any ByteToRESPDecoder {
        switch tag {
        case UInt8(ascii: "+"): return SimpleLineDecoder { .SimpleString($0) }
        case UInt8(ascii: "-"): return SimpleLineDecoder { .SimpleError($0) }
        case UInt8(ascii: ":"):
            return SimpleLineDecoder { raw in
                guard let i = Int64(raw) else {
                    throw RedisError.WithDescription(
                        .ResponseError,
                        "Malformed integer literal: \(raw)")
                }
                return .Int(i)
            }
        case UInt8(ascii: "_"):
            return SimpleLineDecoder { raw in
                guard raw.isEmpty else {
                    throw RedisError.WithDescription(
                        .ResponseError,
                        "NULL payload must be empty, got \(raw)")
                }
                return .Nil
            }
        case UInt8(ascii: "#"):
            return SimpleLineDecoder { raw in
                switch raw.lowercased() {
                case "t": return .Boolean(true)
                case "f": return .Boolean(false)
                default:
                    throw RedisError.WithDescription(
                        .ResponseError,
                        "Invalid boolean literal: \(raw)")
                }
            }
        case UInt8(ascii: ","):
            return SimpleLineDecoder { raw in
                guard let d = Double(raw) else {
                    throw RedisError.WithDescription(
                        .ResponseError,
                        "Invalid double literal: \(raw)")
                }
                return .Double(d)
            }
        case UInt8(ascii: "("):
            return SimpleLineDecoder { raw in
                guard let dec = Decimal(string: raw) else {
                    throw RedisError.WithDescription(
                        .ResponseError,
                        "Invalid big number: \(raw)")
                }
                return .BigNumber(dec)
            }
        case UInt8(ascii: "$"): return LengthPrefixRESPDecoder(inner: BulkStringDecoder())
        case UInt8(ascii: "!"): return LengthPrefixRESPDecoder(inner: BulkErrorDecoder())
        case UInt8(ascii: "="): return LengthPrefixRESPDecoder(inner: VerbatimDecoder())
        case UInt8(ascii: "*"): return LengthPrefixRESPDecoder(inner: CollectionDecoder(.array))
        case UInt8(ascii: ">"): return LengthPrefixRESPDecoder(inner: CollectionDecoder(.push))
        case UInt8(ascii: "%"): return LengthPrefixRESPDecoder(inner: CollectionDecoder(.map))
        case UInt8(ascii: "`"): return LengthPrefixRESPDecoder(inner: CollectionDecoder(.attribute))
        case UInt8(ascii: "~"): return LengthPrefixRESPDecoder(inner: CollectionDecoder(.set))
        default:
            throw RedisError.WithDescription(
                .ResponseError,
                "Unsupported RESP type byte: \(Character(UnicodeScalar(tag)))")
        }
    }
}

/**
 Protocol for decoders that convert bytes to RESP values.
 */
protocol ByteToRESPDecoder {
    mutating func decodeRESP(from buffer: inout ByteBuffer) throws -> RESPType?
}

/**
 A decoder for simple RESP types that are terminated by CRLF.
 */
struct SimpleLineDecoder: ByteToRESPDecoder {
    private let decodeLine: (_ line: String) throws -> RESPType

    init(_ decode: @escaping (_ line: String) throws -> RESPType) {
        self.decodeLine = decode
    }

    mutating func decodeRESP(from buffer: inout ByteBuffer) throws -> RESPType? {
        guard let line = try buffer.readCRLFTerminatedString() else { return nil }
        return try decodeLine(line)
    }
}

/**
 Protocol for RESP frames that start with a length prefix.
 */
protocol LengthPrefixedRESPDecoder {
    mutating func decodeRESP(
        from buffer: inout ByteBuffer,
        length: Int
    ) throws -> RESPType?
}

/**
 A decoder that handles length-prefixed RESP types.
 */
struct LengthPrefixRESPDecoder<Inner: LengthPrefixedRESPDecoder>: ByteToRESPDecoder {
    private var length: Int? = nil  // nil ⇒ haven't seen the prefix yet
    private var inner: Inner

    init(inner: Inner) { self.inner = inner }

    mutating func decodeRESP(from buf: inout ByteBuffer) throws -> RESPType? {
        // Parse the length line
        if length == nil {
            guard let lenStr = try buf.readCRLFTerminatedString() else {
                return nil
            }
            guard let n = Int(lenStr) else {
                throw RedisError.WithDescription(
                    .ResponseError,
                    "Invalid length prefix: \(lenStr)")
            }
            length = n
        }

        // Delegate the payload/body to the concrete decoder
        guard let n = length else { return nil }
        if let frame = try inner.decodeRESP(from: &buf, length: n) {
            length = nil  // reset so the wrapper can be reused
            return frame
        }
        return nil
    }
}

// MARK: - Specific RESP Type Decoders

/// Decoder for RESP bulk strings ($<len>\r\n<data>\r\n)
private struct BulkStringDecoder: LengthPrefixedRESPDecoder {
    mutating func decodeRESP(from buf: inout ByteBuffer, length: Int) throws -> RESPType? {
        if length == -1 { return .Nil }
        guard buf.readableBytes >= length + 2 else { return nil }  // need payload+CRLF
        var slice = buf.readSlice(length: length)!
        guard buf.readString(length: 2) == "\r\n" else {
            throw RedisError.WithDescription(
                .ResponseError, "Bulk string missing CRLF")
        }
        return .BulkString(Data(slice.readBytes(length: slice.readableBytes)!))
    }
}

/// Decoder for RESP bulk errors (!<len>\r\n<error>\r\n)
private struct BulkErrorDecoder: LengthPrefixedRESPDecoder {
    mutating func decodeRESP(from buf: inout ByteBuffer, length: Int) throws -> RESPType? {
        guard buf.readableBytes >= length + 2 else { return nil }
        let str = buf.readString(length: length)!
        guard buf.readString(length: 2) == "\r\n" else {
            throw RedisError.WithDescription(
                .ResponseError, "Bulk error missing CRLF")
        }
        return .BulkError(str)
    }
}

/// Decoder for RESP verbatim strings (=<len>\r\n<enc>:<bytes>\r\n)
private struct VerbatimDecoder: LengthPrefixedRESPDecoder {
    mutating func decodeRESP(from buf: inout ByteBuffer, length: Int) throws -> RESPType? {
        guard buf.readableBytes >= length + 2 else { return nil }
        var payload = buf.readSlice(length: length)!
        guard buf.readString(length: 2) == "\r\n" else {
            throw RedisError.WithDescription(
                .ResponseError, "Verbatim missing CRLF")
        }
        // first 4 chars are "txt:" | "mkd:" etc.
        _ = payload.readString(length: 4)  // ignore encoding tag for now
        let data = payload.readBytes(length: payload.readableBytes)!
        return .VerbatimString(Data(data))
    }
}

/// Decoder for RESP collections (* / % / ` / ~ / >)
private struct CollectionDecoder: LengthPrefixedRESPDecoder {
    enum Kind { case array, map, attribute, set, push }
    private var kind: Kind
    private var elems: [RESPType] = []
    private var delegate = RESPDecoder()  // recursion

    init(_ k: Kind) { kind = k }

    mutating func decodeRESP(from buf: inout ByteBuffer, length: Int) throws -> RESPType? {
        let total = (kind == .map || kind == .attribute) ? length * 2 : length
        while elems.count < total {
            guard let e = try delegate.readOne(from: &buf) else { return nil }
            elems.append(e)
        }

        switch kind {
        case .array, .push: return .Array(elems)
        case .set: return .Set(Set(elems))
        case .map, .attribute:
            var dict: [RESPType: RESPType] = [:]
            stride(from: 0, to: elems.count, by: 2).forEach {
                dict[elems[$0]] = elems[$0 + 1]
            }
            return kind == .map ? .Map(dict) : .Attribute(dict)
        }
    }
}

// MARK: - ByteBuffer Extensions

extension ByteBuffer {
    /// Gets the length of a CRLF-terminated string at the given index.
    func _getCRLFTerminatedStringLength(at index: Int) throws -> Int? {
        guard self.readerIndex <= index && index < self.writerIndex else {
            return nil
        }
        guard let endIndex = self.readableBytesView[index...].firstIndex(of: .init(ascii: "\n")) else {
            return nil
        }
        guard endIndex >= 1, self.readableBytesView[endIndex-1] == .init(ascii: "\r") else {
            throw RedisError.WithDescription(.ResponseError, "Invalid CRLF sequence")
        }
        return endIndex &- (index + 1)
    }

    /// Reads a CRLF-terminated string from the buffer.
    mutating func readCRLFTerminatedString() throws -> String? {
        guard
            let stringLength = try self._getCRLFTerminatedStringLength(
                at: self.readerIndex)
        else {
            return nil
        }
        let result = self.readString(length: stringLength)
        self.moveReaderIndex(forwardBy: 2)
        return result
    }
}
