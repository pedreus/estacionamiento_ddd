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
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        
        do {
            let car = try Car(cylinder: 2000, vehicleLicense: "abc123")
            let entry = try Entry(entryDateTime: actualDate, vehicle: car)
            
            // Act
            let weekDay = entry.getWeekDay()
            print("WeekDay: \(weekDay)")
            
            // Assert
            XCTAssert(weekDay == 1)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func testIsValidVehicleLicenseForWeekDay() {
 
        do {
            // Arrange
            let string = "27/12/2020" // domingo -> 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let entryDate = dateFormatter.date(from: string) ?? Date()
            let vehicle = try Vehicle(cylinder: 3200, vehicleLicense: "abc123")
            
            
            // Act
            let entry = try Entry(entryDateTime: entryDate, vehicle: vehicle)
            print(entry.getWeekDay())
            
            // Assert
            XCTAssert(entry.getWeekDay() == 1)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }

}
