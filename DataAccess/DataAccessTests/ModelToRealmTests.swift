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
    
    func testCarModelToRealm() {
        
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
    
    func testCarEntryModelToRealm() {
        
        do {
            // Arrange
            let car = try Car(cylinder: 2200, vehicleLicense: "abc123")
            let entry = Entry(entryDateTime: Date(), vehicle: car)
            let carEntryTranslator = CarEntryRealmTranslator()
            
            // Act
            let realmEntry = carEntryTranslator.fromModelToRealmEntity(entry: entry)
            
            // Assert
            XCTAssert(realmEntry.getCarRealm()?.getCylinder() == car.getCylinder())
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
    
    func testMotorcycleExitModelToRealm() {
        
        do {
            // Arrange
            let moto = try Motorcycle(cylinder: 1000, vehicleLicense: "abc123")
            let entry = Entry(entryDateTime: Date(), vehicle: moto)
            let exit = Exit(exitDateTime: Date(), entry: entry)
            let motoExitTranslator = MotorcycleExitRealmTranslator()
            
            // Act
            let realmExit = motoExitTranslator.fromModelToRealm(exit: exit)
            
            // Assert
            XCTAssert(realmExit.getEntryRealmEntity()?.getMotorcycleRealm()?.getCylinder() == 1000)
            
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
    
    func testCarBillModelToRealm() {
        
        do {
            
            // Arrange
            let car = try Car(cylinder: 2200, vehicleLicense: "abc123")
            let entry = Entry(entryDateTime: Date(), vehicle: car)
            let exit = Exit(exitDateTime: Date(), entry: entry)
            let bill = Bill(billDateTime: Date(), timeInHours: 9, cost: 50500, exit: exit)
            let carBillranslator = CarBillRealmTranslator()
            
            // Act
            let realBill = carBillranslator.fromModelToRealm(bill: bill)
            
            // Assert
            XCTAssert(realBill.getBillDateTime() == bill.getBillDateTime() && realBill.getCarExitRealm()?.getEntryRealmEntity()?.getCarRealm()?.getCylinder() == 2200)
            
        } catch (let errorMessage) {
            print(errorMessage)
        }
    }
}
