//
//  ModelToRealmTests.swift
//  DataAccessTests
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import XCTest
@testable import Domain
@testable import DataAccess

class ModelToRealmTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_transformCarModelToRealm_success() {
        
        do {
            // Arrange
            let car = try Car(cylinder: 2000, vehicleLicense: "abc123")
            let carRealmTranslator = CarRealmTranslator()
            
            // Act
            let carRealm = carRealmTranslator.fromModelToRealmEntity(car: car)
            
            // Assert
            XCTAssert(carRealm.getCylinder() == car.getCylinder())
            
        } catch (let errorMessage) {
            print(errorMessage)
        }
        
    }
    
    func test_transformCarEntryModelToRealm_success() {
        
        do {
            // Arrange
            let car = try Car(cylinder: 2200, vehicleLicense: "abc123")
            let entry = try CarEntry(entryDateTime: Date(), car: car)
            let carEntryTranslator = CarEntryRealmTranslator()
            
            // Act
            let carRealm = carEntryTranslator.fromModelToRealmEntity(carEntry: entry)
            
            // Assert
            XCTAssert(carRealm.getCylinder() == car.getCylinder())
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
    
    func test_transformMotorcycleExitModelToRealm_success() {
        
        do {
            // Arrange
            let moto = try Motorcycle(cylinder: 1000, vehicleLicense: "abc123")
            let entry = try MotorcycleEntry(entryDateTime: Date(), motorcycle: moto)
            let exit = MotorcycleExit(exitDateTime: Date(), motoEntry: entry)
            let motoExitTranslator = MotorcycleExitRealmTranslator()
            
            // Act
            let motoRealm = motoExitTranslator.fromModelToRealm(motoExit: exit)
            
            // Assert
            XCTAssert(motoRealm.motoEntries.first?.motoExit.first?.getExitDateTime() == exit.getExitDateTime())
            
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
    
    func test_transformCarBillModelToRealm_success() {
        
        do {
            
            // Arrange
            let car = try Car(cylinder: 2200, vehicleLicense: "abc123")
            let entry = try CarEntry(entryDateTime: Date(), car: car)
            let exit = CarExit(exitDateTime: Date(), carEntry: entry)
            let bill = CarBill(billDateTime: Date(), carExit: exit)
            let carBillranslator = CarBillRealmTranslator()
            
            // Act
            let carRealm = carBillranslator.fromModelToRealm(carBill: bill)
            
            // Assert
            XCTAssert(carRealm.carEntries.first?.carExit.first?.carBill.first?.getCost() == bill.getCost())
            
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
}
