//
//  MotorcycleEntryProtocol.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import Foundation

public protocol MotorcycleRepository: VehicleRepository {
    
    // Valida si hay cupo de motocicletas en el parqueadero
    func isValidMotorcyclesQuantity() throws -> Bool
    
    func saveMotorcycle(motorcylce: Motorcycle) throws
}
