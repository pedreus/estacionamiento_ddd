//
//  CarEntryRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

public protocol CarRepository: VehicleRepository {
    
    func saveCar(car: Car) throws
}
