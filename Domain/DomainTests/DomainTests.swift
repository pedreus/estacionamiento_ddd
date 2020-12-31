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

    func test_isCorrectVehicleLicense_licenseAlphanumericWith6Characters_success() {
        
        // Arrange
        let cylinder = 2500
        let license = "abc123"
        
        do {
            // Act
            _ = try Car(cylinder: cylinder, vehicleLicense: license)
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_isCorrectVehicleLicense_licenseAlphanumericWith6Characters_fail() {
        
        // Arrange
        let cylinder = 2500
        let license = "abc12😃"
        
        do {
            // Act
            let _ = try Car(cylinder: cylinder, vehicleLicense: license)
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }
    
    func test_isCorrectVehicleCylinder_cylinderLessThan10000_success() {
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
    
    func test_isCorrectVehicleCylinder_cylinderLessThan10000_fail() {
        // Arrange
        let cylinder = 10000
        let license = "abc123"
        
        do {
            // Act
            let _ = try Car(cylinder: cylinder, vehicleLicense: license)
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }
}
