//
//  MotorcycleEntryProtocol.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

public protocol MotorcycleRepository: VehicleRepository {
    
    func saveMotorcycle(motorcylce: Motorcycle) throws
}
