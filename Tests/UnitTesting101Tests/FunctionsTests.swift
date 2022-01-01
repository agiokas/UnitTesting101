import XCTest
@testable import UnitTesting101

final class FunctionsTests: XCTestCase {
    func testAddTwoNumbers_basics() throws {
        XCTAssertEqual(try addInt(10, 20), 30)
        XCTAssertEqual(try addInt(-10, 20), 10)
        XCTAssertEqual(try addInt(-10, -20), -30)
    }
    
    func testAddTwoNumbers_max() throws {
        XCTAssertThrowsError(try addInt(1, Int.max))
        XCTAssertThrowsError(try addInt(Int.max, 1))
        XCTAssertThrowsError(try addInt(Int.max, Int.max))
        
        XCTAssertEqual(try addInt(Int.max, 0), Int.max)
        XCTAssertEqual(try addInt(0, Int.max), Int.max)
        
        XCTAssertEqual(try addInt(Int.max, -10), Int.max - 10)
        XCTAssertEqual(try addInt(-10, Int.max), Int.max - 10)
        
        XCTAssertThrowsError(try addInt(Int.max - 10, Int.max - 10))
    }
    
    func testAddTwoNumbers_min() throws {
        XCTAssertThrowsError(try addInt(-1, Int.min))
        XCTAssertThrowsError(try addInt(Int.min, -1))
        XCTAssertThrowsError(try addInt(Int.min, Int.min))
        
        XCTAssertEqual(try addInt(Int.min, 0), Int.min)
        XCTAssertEqual(try addInt(0, Int.min), Int.min)
        
        XCTAssertEqual(try addInt(Int.min, 10), Int.min + 10)
        XCTAssertEqual(try addInt(10, Int.min), Int.min + 10)

        XCTAssertThrowsError(try addInt(Int.min + 10, Int.min + 10))
    }
}
