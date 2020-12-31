//
//  ModelExitUnitTest.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import XCTest
@testable import Domain

class ModelExitUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getExpendedTimeInDaysAndHours_1days3hours_success() {
        // Arrange
        let string = "27/12/2020" // domingo -> 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let today = dateFormatter.date(from: string) ?? Date()
        // Se resta un día
        let yesterday = Date(timeInterval: -86400, since: today)
        // Se suman 3 horas
        let tomorrow = Date(timeInterval: 10800, since: today)
        
        do {
            let car = try Car(cylinder: 2000, vehicleLicense: "xbc123")
            // El vehículo entró el día de ayer
            let entry = try CarEntry(entryDateTime: yesterday, car: car)
            // El vehículo sale mañana
            let exit = CarExit(exitDateTime: tomorrow, carEntry: entry)
            
            // Act
            let (days, hours) = exit.getExpendedTimeInDaysAndHours()
            print("Tupla expended time: \(days) \(hours)")
            
            // Assert
            XCTAssert(days == 1 && hours == 3)
        } catch (let errorMessage) {
            print(errorMessage)
            XCTAssert(false)
        }
    }
}
