//
//  RESPDecoderTypeTests.swift
//  SwiftyRedis
//
//  Created by Michael van Straten on 22.04.25.
//

import NIOTestUtils
import XCTest

@testable import SwiftyRedis

final class RESPDecoderTypeTests: XCTestCase {

    // MARK: – Generic helper
    private func verify(
        wire: String,
        expected: RESPValue,
        file: StaticString = #file,
        line: UInt = #line
    ) throws {
        try ByteToMessageDecoderVerifier.verifyDecoder(
            stringInputOutputPairs: [(wire, [expected])],
            decoderFactory: { RESPDecoder() }
        )
    }

    // MARK: – Simple scalars ----------------------------------------------

    func testSimpleString() throws {
        try verify(wire: "+OK\r\n", expected: .simpleString("OK"))
    }

    func testSimpleError() throws {
        try verify(
            wire: "-ERR unknown command 'FOO'\r\n",
            expected: .simpleError("ERR unknown command 'FOO'"))
    }

    func testInteger() throws {
        try verify(wire: ":1000\r\n", expected: .integer(1_000))
    }

    func testBulkString() throws {
        try verify(wire: "$5\r\nhello\r\n", expected: .bulkStrng("hello"))
    }

    func testNull() throws {
        try verify(wire: "_\r\n", expected: .null)
    }

    func testBooleanTrue() throws {
        try verify(wire: "#t\r\n", expected: .boolean(true))
    }

    func testBooleanFalse() throws {
        try verify(wire: "#f\r\n", expected: .boolean(false))
    }

    func testDouble() throws {
        try verify(wire: ",3.141\r\n", expected: .double(3.141))
    }

    func testBigNumber() throws {
        let big = "3492890328409238509324850943850943825024385"
        try verify(
            wire: "(\(big)\r\n",
            expected: .bigNumber(Decimal(string: big)!))
    }

    func testBulkError() throws {
        let payload = "SYNTAX invalid syntax"  // 21 bytes
        try verify(
            wire: "!\(payload.count)\r\n\(payload)\r\n",
            expected: .bulkError(payload))
    }

    func testVerbatimString() throws {
        let txt = "Hello World"  // 11 bytes
        let wire = "=15\r\ntxt:\(txt)\r\n"  // 4 + 11 = 15
        try verify(
            wire: wire,
            expected: .verbatimString(Data(txt.utf8)))
    }

    // MARK: – Aggregates ----------------------------------------------------

    func testArray() throws {
        let wire = "*2\r\n$3\r\nfoo\r\n$3\r\nbar\r\n"
        let model: RESPValue = .array([.bulkStrng("foo"), .bulkStrng("bar")])
        try verify(wire: wire, expected: model)
    }

    func testMap() throws {
        let wire = "%2\r\n+first\r\n:1\r\n+second\r\n:2\r\n"
        let model: RESPValue = .map([
            .simpleString("first"): .integer(1),
            .simpleString("second"): .integer(2),
        ])
        try verify(wire: wire, expected: model)
    }

    func testAttribute() throws {
        let wire = "`1\r\n+ttl\r\n:64\r\n"
        let model: RESPValue = .attribute([
            .simpleString("ttl"): .integer(64)
        ])
        try verify(wire: wire, expected: model)
    }

    func testSet() throws {
        let wire = "~3\r\n:1\r\n:2\r\n:3\r\n"
        let elems: Set<RESPValue> = [.integer(1), .integer(2), .integer(3)]
        try verify(wire: wire, expected: .set(elems))
    }
}
