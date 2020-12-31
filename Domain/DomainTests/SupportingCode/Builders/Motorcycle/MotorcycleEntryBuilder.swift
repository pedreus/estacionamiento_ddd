//
//  MotorcycleEntryBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

@testable import Domain

public class MotorcycleEntryBuilder: VehicleEntryBuilder {
    
    func with(moto: Motorcycle) -> MotorcycleEntryBuilder {
        return super.with(vehicle: moto) as! MotorcycleEntryBuilder
    }
    
    override func build() throws -> MotorcycleEntry {
        let unwrappedMoto: Motorcycle?
        if let moto = vehicle as? Motorcycle {
            unwrappedMoto = moto
        } else {
            unwrappedMoto = try MotorcycleBuilder().build()
        }
        
        return try MotorcycleEntry(entryDateTime: entryDate, motorcycle: unwrappedMoto!)
    }
}
