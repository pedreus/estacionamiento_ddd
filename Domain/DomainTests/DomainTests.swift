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
        
        do {
            // Act
            _ = try CarBuilder()
                .build()
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_isCorrectVehicleLicense_licenseAlphanumericWith6Characters_fail() {
        
        // Arrange
        let license = "abc12😃"
        
        do {
            // Act
            let _ = try CarBuilder()
                .with(license: license)
                .build()
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }
    
    func test_isCorrectVehicleCylinder_cylinderLessThan10000_success() {
        // Arrange
        let cylinder = 1000
        
        do {
            // Act
            let _ = try CarBuilder()
                .with(cylinder: cylinder)
                .build()
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_isCorrectVehicleCylinder_cylinder10000_fail() {
        // Arrange
        let cylinder = 10000
        
        do {
            // Act
            let _ = try CarBuilder()
                .with(cylinder: cylinder)
                .build()
            
        } catch (let errorMessage) {
            print(errorMessage)
            
            // Assert
            XCTAssert(true)
        }
    }
}
