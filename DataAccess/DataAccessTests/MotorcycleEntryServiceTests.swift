//
//  MotorcycleEntryServiceRealm.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class MotorcycleEntryServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_validMotorcycleQuantity_LessThan10_success() {
        
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let motoRepository = try MotorcycleEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleEntryService(motorcycleEntryRepository: motoRepository)
            
            // Act
            let isValidQuantity = try motoService.isValidMotorcyclesQuantity(maxQuantity: 10)
            
            // Assert
            XCTAssert(isValidQuantity == true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_validMotorcycleQuantity_LessThan1_fail() {
        
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let motoRepository = try MotorcycleEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleEntryService(motorcycleEntryRepository: motoRepository)
            
            // Act
            let isValidQuantity = try motoService.isValidMotorcyclesQuantity(maxQuantity: 1)
            
            // Assert
            XCTAssert(isValidQuantity == false)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_saveMotorcycleEntry_success() {
        
        // Arrange
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            let moto = try Motorcycle(cylinder: 2000, vehicleLicense: "abc123")
            let motoEntry = try MotorcycleEntry(entryDateTime: actualDate, motorcycle: moto)
            let motoEntryRepository = try MotorcycleEntryRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoEntryService = MotorcycleEntryService(motorcycleEntryRepository: motoEntryRepository)
            
            // Act
            try motoEntryService.saveMotorcycleEntry(motoEntry: motoEntry)
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
}
