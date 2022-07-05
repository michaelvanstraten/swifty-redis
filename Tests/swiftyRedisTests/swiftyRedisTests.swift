import XCTest
@testable import swiftyRedis

final class swiftyRedisTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swiftyRedis().text, "Hello, World!")
    }
}
