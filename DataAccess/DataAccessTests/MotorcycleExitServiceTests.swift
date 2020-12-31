//
//  MotorcycleExitServiceTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class MotorcycleExitServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_saveMotorcycleExit_success() {
        
        // Arrange
        let actualStringDate = "27/12/2020" // domingo -> 1
        let exitStringDate = "29/12/2020" // martes -> 3
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: actualStringDate) ?? Date()
        let exitDate = dateFormatter.date(from: exitStringDate) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            // Arrange
            let moto = try Motorcycle(cylinder: 500, vehicleLicense: "abc456")
            let motoEntry = try MotorcycleEntry(entryDateTime: actualDate, motorcycle: moto)
            let motoExit = MotorcycleExit(exitDateTime: exitDate, motoEntry: motoEntry)
            let motoExitRepository = try MotorcycleExitRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoExitService = MotorcycleExitService(motoExitRepository: motoExitRepository)
            
            // Act
            try motoExitService.saveMotorcycleExit(motoExit: motoExit)
            
            // Assert
            XCTAssert(true)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }
}
