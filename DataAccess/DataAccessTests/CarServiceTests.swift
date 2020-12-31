//
//  VehicleServiceTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class CarServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_carExists_licenseExits_success() {
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try CarRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carService = CarService(carRepository: realmRepository)
            
            // Act
            let carExists = try carService.isVehicleExists(vehicleLicense: "abc456")
            
            // Assert
            XCTAssert(carExists == true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }
    
    func test_carExists_newLincese_fail() {
        do {
            // Arrange
            let testRealmConfig = TestRealmConfiguration()
            let realmRepository = try CarRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carService = CarService(carRepository: realmRepository)
            
            // Act
            let exists = try carService.isVehicleExists(vehicleLicense: "abc987")
            
            // Assert
            XCTAssert(exists == false)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }
    
    func test_saveCar_newLicense_success() {
        // Arrange
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            // Cambiar la placa
            let car = try Car(cylinder: 2500, vehicleLicense: "xyz123")
            let carRepository = try CarRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carService = CarService(carRepository: carRepository)

            // Act
            try carService.saveCar(car: car)
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_saveCar_licenseExists_fail() {
        // Arrange
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            // Cambiar la placa
            let car = try Car(cylinder: 2500, vehicleLicense: "xyz123")
            let carRepository = try CarRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let carService = CarService(carRepository: carRepository)

            // Act
            try carService.saveCar(car: car)
            XCTAssert(false)
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
        
    }
}
