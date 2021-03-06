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

    func test_saveCarExit_success() {
        
        // Arrange
        let actualString = "27/12/2020" // domingo -> 1
        let exitString = "29/12/2020" // martes -> 3
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: actualString) ?? Date()
        let exitDate = dateFormatter.date(from: exitString) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            let car = try Car(cylinder: 1200, vehicleLicense: "abc789")
            let carEntry = try CarEntry(entryDateTime: actualDate, car: car)
            let carExit = CarExit(exitDateTime: exitDate, carEntry: carEntry)
            let carExitRepository = try CarExitRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
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
