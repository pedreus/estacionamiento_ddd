//
//  DomainTests.swift
//  DomainTests
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 28/10/20.
//

import XCTest
@testable import Domain

class DomainTests: XCTestCase {

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

    func testIsValidVehicleLicense() {
        
        // Arrange
        let cylinder = 2500
        let license = "abc12😃"
        
        do {
            // Act
            let car = try Car(cylinder: cylinder, vehicleLicense: license)
            
            // Assert
            XCTAssert(car.getVehicleLicense() == "abc123")
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(true)
        }
    }
    
    func testIsVehicleCylinderValid() {
        // Arrange
        let cylinder = 1000
        let license = "abc123"
        
        do {
            // Act
            let _ = try Car(cylinder: cylinder, vehicleLicense: license)
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
}
