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

    func testIsCarExists() {
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
    
    func testSaveCar() {
        // Arrange
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            // Cambiar la placa
            let car = try Car(cylinder: 2500, vehicleLicense: "abc123")
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
}
