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
    
    func test_calculateCarServiceCost_2days3hours_success() {
        do {
            // Arrange
            let string = "28/12/2020" // lunes -> 2
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let today = dateFormatter.date(from: string) ?? Date()
            
            let entryDate = Date(timeInterval: -86400, since: today)
            let exitDate = Date(timeInterval: 10800, since: today)
            
            let carEntry = try CarEntryBuilder()
                .with(entryDate: entryDate)
                .build() as! CarEntry
            
            let carExit = try CarExitBuilder()
                .with(exitDate: exitDate)
                .with(entry: carEntry)
                .build() as! CarExit
            
            let carBill = try CarBillBuilder()
                .with(carExit: carExit)
                .build()
            
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
    
    func test_calculateMotorcycleServiceCost_1days6hoursLessThan500Cylinder_success() {
        
        do {
            // Arrange
            let string = "28/12/2020" // lunes -> 2
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let today = dateFormatter.date(from: string) ?? Date()
            
            let entryDate = Date(timeInterval: 0, since: today)
            let exitDate = Date(timeInterval: 54000, since: today)
            
            let moto = try MotorcycleBuilder()
                .with(cylinder: 450)
                .build()
            
            let motoEntry = try MotorcycleEntryBuilder()
                .with(entryDate: entryDate)
                .with(vehicle: moto)
                .build() as! MotorcycleEntry
            
            let motoExit = try MotorcycleExitBuilder()
                .with(exitDate: exitDate)
                .with(entry: motoEntry)
                .build() as! MotorcycleExit
            
            print("Tiempo: \(motoExit.getExpendedTimeInDaysAndHours().0) \(motoExit.getExpendedTimeInDaysAndHours().1)")
            
            // Act
            let motoBill = MotorcycleBill(billDateTime: exitDate, motoExit: motoExit)
            print("Bill: \(motoBill.getCost())")
            
            // Assert
            XCTAssert(motoBill.getCost() == 7000)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
    
    func test_calculateMotorcycleServiceCost_1days6hoursMoreThan500Cylinder_success() {
        
        do {
            // Arrange
            let string = "28/12/2020" // lunes -> 2
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            let today = dateFormatter.date(from: string) ?? Date()
            
            let entryDate = Date(timeInterval: 0, since: today)
            let exitDate = Date(timeInterval: 54000, since: today)
            
            let motoEntry = try MotorcycleEntryBuilder()
                .with(entryDate: entryDate)
                .build() as! MotorcycleEntry
            
            let motoExit = try MotorcycleExitBuilder()
                .with(exitDate: exitDate)
                .with(entry: motoEntry)
                .build() as! MotorcycleExit
            
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
