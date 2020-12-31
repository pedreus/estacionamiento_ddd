//
//  CarEntryBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

@testable import Domain

public class CarEntryBuilder: VehicleEntryBuilder {
    
    func with(car: Car) -> CarEntryBuilder {
        return super.with(vehicle: car) as! CarEntryBuilder
    }
    
    override func build() throws -> CarEntry {
        let unwrappedCar: Car?
        
        if let car = vehicle as? Car {
            unwrappedCar = car
        } else {
            unwrappedCar = try CarBuilder().build()
        }
        
        return try CarEntry(entryDateTime: entryDate, car: unwrappedCar!)
    }
}
