//
//  MotorcycleServiceRealmTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class MotorcycleServiceTests: XCTestCase {

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
    
    func testMotorcycleExists() {
                
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try MotorcycleRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleService(motorcycleRepository: realmRepository)
            
            // Act
            let isMotoExists = try motoService.isVehicleExists(vehicleLicense: "abc123")
            
            // Assert
            XCTAssert(isMotoExists == true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func testSaveMotorcycle() {
        
        do {
            // Arrange
            let motorcycle = try Motorcycle(cylinder: 1000, vehicleLicense: "abc123")
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try MotorcycleRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleService(motorcycleRepository: realmRepository)
            
            //Act
            try motoService.saveMotorcycle(motorcycle: motorcycle)
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }

}
