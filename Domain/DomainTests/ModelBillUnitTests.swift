//
//  ModelBillUnitTests.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//

import XCTest
@testable import Domain

class ModelBillUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_calculateCarServiceCost_2days3hoursService_success() {
        do {
            // Arrange
            let string = "27/12/2020" // domingo -> 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let today = dateFormatter.date(from: string) ?? Date()
            
            let entryDate = Date(timeInterval: -86400, since: today)
            let exitDate = Date(timeInterval: 10800, since: today)
            let car = try Car(cylinder: 1200, vehicleLicense: "vbc123")
            let carEntry = try CarEntry(entryDateTime: entryDate, car: car)
            let carExit = CarExit(exitDateTime: exitDate, carEntry: carEntry)
            let carBill = CarBill(billDateTime: exitDate, carExit: carExit)
            
            // Valores en consola
            print("Tiempos: \(carExit.getExpendedTimeInDaysAndHours().0) - \(carExit.getExpendedTimeInDaysAndHours().1)")
            
            // Act
            let cost = carBill.getCost()
            print("Costo: \(cost)")
            
            // Assert
            XCTAssert(cost == 11000)
            
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_calculateMotorcycleServiceCost_1days6hoursService_success() {
        
        do {
            // Arrange
            let string = "27/12/2020" // domingo -> 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let today = dateFormatter.date(from: string) ?? Date()
            
            let entryDate = Date(timeInterval: 0, since: today)
            let exitDate = Date(timeInterval: 54000, since: today)
            let moto = try Motorcycle(cylinder: 600, vehicleLicense: "bbc123")
            let motoEntry = try MotorcycleEntry(entryDateTime: entryDate, motorcycle: moto)
            let motoExit = MotorcycleExit(exitDateTime: exitDate, motoEntry: motoEntry)
            
            print("Tiempo: \(motoExit.getExpendedTimeInDaysAndHours().0) \(motoExit.getExpendedTimeInDaysAndHours().1)")
            
            // Act
            let motoBill = MotorcycleBill(billDateTime: exitDate, motoExit: motoExit)
            print("Bill: \(motoBill.getCost())")
            
            // Assert
            XCTAssert(motoBill.getCost() == 9000)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }

}
