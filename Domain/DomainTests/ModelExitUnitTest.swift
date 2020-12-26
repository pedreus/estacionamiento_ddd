//
//  ModelExitUnitTest.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import XCTest
@testable import Domain

class ModelExitUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetExpendedTimeInHours() {
        // Arrange
        let today = Date()
        
        let yesterday = Date(timeInterval: -86400, since: today)
        let car = Car(cylinder: 2000, vehicleLicense: "abc123")
        // El vehículo entró el día de ayer
        let entry = Entry(entryDateTime: yesterday, vehicle: car)
        
        let tomorrow = Date(timeInterval: 96400, since: today)
        // El vehículo sale mañana
        let exit = Exit(exitDateTime: tomorrow, entry: entry)
        
        // Act
        let expendedTimeInHours = exit.getExpendedTimeInHours()
        print("Hours: \(expendedTimeInHours)")
        
        // Assert
        XCTAssert(expendedTimeInHours > -1)
    }
}
