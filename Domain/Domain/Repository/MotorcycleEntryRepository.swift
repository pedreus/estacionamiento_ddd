//
//  MotorcycleEntryRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public protocol MotorcycleEntryRepository {
    
    // Valida si hay cupos de motos en el parqueadero
    func isValidMotorcyclesQuantity(maxQuantity: Int) throws -> Bool
    
    func saveMotorcycleEntry(motoEntry: MotorcycleEntry) throws
}
