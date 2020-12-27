//
//  PresentationCarUnitTest.swift
//  PresentationTests
//
//  Created by Pedro Erazo Acosta on 25/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class PresentationCarUnitTest: XCTestCase {

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
    
    func testIsValidCarQuantity() {
        // Arrange
        let carService = CarService(carRepository: CarRepositoryRealm())
        
        // Act
        let isValidCar = carService.isValidCarQuantity()
        
        // Assert
        XCTAssert(isValidCar == true)
    }
    
    func testSaveCar() {
        // Arrange
        let car = Car(cylinder: 1200, vehicleLicense: "abc123")
        let carService = CarService(carRepository: CarRepositoryRealm())
        
        // Act
        var carSaved = false
        do {
            try carService.saveCar(car: car)
            carSaved = true
        } catch BusinessError.VehicleAlreadyExists(let errorMessage) {
            print(errorMessage)
        } catch {
            print(BusinessError.VehicleSaveError())
        }
        
        // Assert
        XCTAssert(carSaved == true)
    }

}
