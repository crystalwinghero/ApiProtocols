import XCTest
@testable import ApiProtocols

final class ApiProtocolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ApiProtocols().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
