//
//  CarEntryRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import Foundation

public protocol CarRepository: VehicleRepository {
    
    // Valida si hay cupos de carros en el parqueadero
    func isValidCarsQuantity() throws -> Bool    
    
    func saveCar(car: Car) throws
}
