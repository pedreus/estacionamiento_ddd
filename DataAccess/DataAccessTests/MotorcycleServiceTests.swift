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
    
    func test_MotorcycleExists_licenseExists_success() {
                
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
    
    func test_MotorcycleExists_newLicense_fail() {
                
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try MotorcycleRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleService(motorcycleRepository: realmRepository)
            
            // Act
            let exists = try motoService.isVehicleExists(vehicleLicense: "abc999")
            
            // Assert
            XCTAssert(exists == false)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_saveMotorcycle_newMotorcycle_success() {
        do {
            // Arrange
            let motorcycle = try Motorcycle(cylinder: 1000, vehicleLicense: "abc456")
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
    
    func test_saveMotorcycle_newMotorcycle_fail() {
        do {
            // Arrange
            let motorcycle = try Motorcycle(cylinder: 1000, vehicleLicense: "abc456")
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try MotorcycleRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleService(motorcycleRepository: realmRepository)
            
            //Act
            try motoService.saveMotorcycle(motorcycle: motorcycle)
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(true)
        }
    }

}
