//
//  ModelEntryUnitTaste.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import XCTest
@testable import Domain

class ModelEntryUnitTest: XCTestCase {
    

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
    
    func testGetWeekDayFromEntryDateTime () throws {
        // Arrange
        let actualDate = Date()
        let car = Car(cylinder: 2000, vehicleLicense: "abc123")
        let entry = Entry(entryDateTime: actualDate, vehicle: car)
        
        // Act
        let weekDay = entry.getWeekDay()
        print("WeekDay: \(weekDay)")
        
        // Assert
        XCTAssert(weekDay > 0 && weekDay < 8)
        
    }

}
