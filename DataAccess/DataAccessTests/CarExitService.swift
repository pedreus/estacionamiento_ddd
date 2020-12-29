//
//  CarExitService.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class CarExitServiceTests: XCTestCase {

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

    func testSaveCarExit() {
        
        // Arrange
        let actualString = "27/12/2020" // domingo -> 1
        let exitString = "29/12/2020" // martes -> 3
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: actualString) ?? Date()
        let exitDate = dateFormatter.date(from: exitString) ?? Date()
        
        
        do {
            // Arrange
            let car = try Car(cylinder: 1200, vehicleLicense: "abc456")
            let carEntry = try CarEntry(entryDateTime: actualDate, car: car)
            let carExit = CarExit(exitDateTime: exitDate, carEntry: carEntry)
            let carExitRepository = CarExitRealmRepository(realmConfiguration: RealmConfiguration.testDataConfiguration())
            let carExitService = CarExitService(carExitRepository: carExitRepository)
            
            // Act
            try carExitService.saveCarExitRepository(carExit: carExit)
            
            // Assert
            XCTAssert(true)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }
}
