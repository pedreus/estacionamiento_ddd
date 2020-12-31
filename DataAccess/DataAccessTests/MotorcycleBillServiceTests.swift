//
//  MotorcycleBillServiceTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class MotorcycleBillServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_saveMotorcycleBill_success() {
        
        // Arrange
        let actualDateString = "29/12/2020" // martes -> 3
        let entryDateString = "27/12/2020" // domigno -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let actualDate = dateFormatter.date(from: actualDateString) ?? Date()
        let entryDate = dateFormatter.date(from: entryDateString) ?? Date()
        let testRealmConfig = TestRealmConfiguration()
        
        do {
            let moto = try Motorcycle(cylinder: 1000, vehicleLicense: "abc789")
            let motoEntry = try MotorcycleEntry(entryDateTime: entryDate, motorcycle: moto)
            let motoExit = MotorcycleExit(exitDateTime: actualDate, motoEntry: motoEntry)
            let motoBill = MotorcycleBill(billDateTime: actualDate, motoExit: motoExit)
            let motoRepository = try MotorcycleBillRealmRepository(realmConfiguration: testRealmConfig.getTestDataConfiguration())
            let motoService = MotorcycleBillService(motoBillRepository: motoRepository)
            
            // Act
            try motoService.saveMotorcycleBill(motoBill: motoBill)
            
            // Assert
            XCTAssert(true)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
        
    }
}
