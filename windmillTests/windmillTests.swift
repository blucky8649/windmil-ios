//
//  windmillTests.swift
//  windmillTests
//
//  Created by 이동연 on 12/1/23.
//

import XCTest
@testable import windmill

final class windmillTests: XCTestCase {
    
    var preset: Preset!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        preset = createPreset(presetName: "preset 1", totalWeeks: 26, weeklyIncrease: 5000, targetWeek: 26)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNameIsEqual() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        print("test!")
        
        XCTAssertEqual(preset.name, "preset 1")
    }
    
    func testAccAmounts() throws {
        let amounts = preset.weeklyData[25].amountAcc
        XCTAssertEqual(amounts, 16_380_000)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
