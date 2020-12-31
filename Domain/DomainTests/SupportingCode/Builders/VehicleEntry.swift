//
//  VehicleEntry.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class VehicleEntryBuilder {
    
    var weekDay: Int = 1 // Domingo 1
    var entryDate: Date = Date()
    var vehicle: Vehicle? = nil
    
    func with(weekDay: Int) -> VehicleEntryBuilder {
        self.weekDay = weekDay
        return self
    }
    
    func with(entryDate: Date) -> VehicleEntryBuilder {
        self.entryDate = entryDate
        return self
    }
    
    func with(vehicle: Vehicle) -> VehicleEntryBuilder {
        self.vehicle = vehicle
        return self
    }
}
