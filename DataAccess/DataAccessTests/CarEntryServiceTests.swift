//
//  CarEntryServiceTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class CarEntryServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_validCarQuantity_lessThan20_success() {
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let carEntryRealmRepository = try CarEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carEntryService = CarEntryService(carEntryRepository: carEntryRealmRepository)
            
            // Act
            let isValidQuantity = try carEntryService.isValidCarQuantity(maxQuantity: 20)
            
            // Assert
            XCTAssert(isValidQuantity == true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_validCarQuantity_lessThan1_fail() {
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let carEntryRealmRepository = try CarEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carEntryService = CarEntryService(carEntryRepository: carEntryRealmRepository)
            
            // Act
            let isValidQuantity = try carEntryService.isValidCarQuantity(maxQuantity: 1)
            
            // Assert
            XCTAssert(isValidQuantity == false)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_saveCarEntry_sundayAndLicenseWith_A_success() {
        
        // Arrange
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            
            // Arrange
            let car = try Car(cylinder: 2000, vehicleLicense: "abc123")
            let carEntry = try CarEntry(entryDateTime: actualDate, car: car)
            let carEntryRealmRepository = try CarEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carEntryService = CarEntryService(carEntryRepository: carEntryRealmRepository)
            
            // Act
            try carEntryService.saveCarEntry(carEntry: carEntry)
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_saveCarEntry_saturdaryAndLicenseWith_A_fail() {
        
        // Arrange
        let string = "26/12/2020" // sábado -> 7
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            
            // Arrange
            let car = try Car(cylinder: 2000, vehicleLicense: "abc123")
            let carEntry = try CarEntry(entryDateTime: actualDate, car: car)
            let carEntryRealmRepository = try CarEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carEntryService = CarEntryService(carEntryRepository: carEntryRealmRepository)
            
            // Act
            try carEntryService.saveCarEntry(carEntry: carEntry)
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }
    
}
