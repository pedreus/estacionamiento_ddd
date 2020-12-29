//
//  File.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public protocol CarEntryRepository {
    
    // Valida si hay cupos de carros en el parqueadero
    func isValidCarsQuantity(maxQuantity: Int) throws -> Bool
    
    func saveCarEntry(carEntry: CarEntry) throws

}
