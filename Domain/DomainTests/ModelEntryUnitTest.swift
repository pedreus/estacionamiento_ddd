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
    
    func test_isValidWeekDayNumberForEntryDate_SundayIsNumber1_success () throws {
        // Arrange
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        
        do {
            let car = try Car(cylinder: 2000, vehicleLicense: "abc123")
            let entry = try CarEntry(entryDateTime: actualDate, car: car)
            
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
    
    func test_authorizedVehicleLicenseForEntryWeekDay_LicenseStartsWith_A_WeekDayIs1_success() {
 
        do {
            // Arrange
            let string = "27/12/2020" // domingo -> 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let entryDate = dateFormatter.date(from: string) ?? Date()
            let car = try Car(cylinder: 3200, vehicleLicense: "abc123")
            
            
            // Act
            let entry = try CarEntry(entryDateTime: entryDate, car: car)
            print(entry.getWeekDay())
            
            // Assert
            XCTAssert(entry.getWeekDay() == 1)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_authorizedVehicleLicenseForEntryWeekDay_LicenseStartsWith_A_WeekDayIs7_fail() {
 
        do {
            // Arrange
            let string = "26/12/2020" // sábado -> 7
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let entryDate = dateFormatter.date(from: string) ?? Date()
            let car = try Car(cylinder: 3200, vehicleLicense: "abc123")
            
            
            // Act
            let entry = try CarEntry(entryDateTime: entryDate, car: car)
            print(entry.getWeekDay())
            
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }

}
