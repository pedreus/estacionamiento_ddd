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

    func testIsValidMotorcycleQuantity() {
        
        // Arrange
        let motoRepository = MotorcycleEntryRealmRepository(realmConfiguration: RealmConfiguration.testDataConfiguration())
        let motoService = MotorcycleEntryService(motorcycleEntryRepository: motoRepository)
        
        do {
            // Act
            let isValidQuantity = try motoService.isValidMotorcyclesQuantity(maxQuantity: 10)
            
            // Assert
            XCTAssert(isValidQuantity == true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func testSaveMotorcycleEntry() {
        
        // Arrange
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: string) ?? Date()
        
        let motoEntryRepository = MotorcycleEntryRealmRepository(realmConfiguration: RealmConfiguration.testDataConfiguration())
        let motoEntryService = MotorcycleEntryService(motorcycleEntryRepository: motoEntryRepository)
        
        
        do {
            // Arrange
            let moto = try Motorcycle(cylinder: 2000, vehicleLicense: "abc123")
            let motoEntry = try MotorcycleEntry(entryDateTime: actualDate, motorcycle: moto)
        
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
