//
//  MotorcycleService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import UIKit

public class MotorcycleService: VehicleService {
    
    var motorcycleRepository: MotorcycleRepository
    
    public init(motorcycleRepository: MotorcycleRepository) {
        self.motorcycleRepository = motorcycleRepository
        super.init(vehicleRepository: self.motorcycleRepository)
    }
    
    func isValidMotorcylcesQuantity() -> Bool {
        return self.motorcycleRepository.isValidMotorcyclesQuantity()
    }
    
    func saveMotorcycle(motorcycle: Motorcycle) throws {
        if (self.motorcycleRepository.isVehicleExists(vehicleLicense: motorcycle.getVehicleLicense())) {
            throw BusinessError.VehicleAlreadyExists()
        }
        self.motorcycleRepository.saveMotorcycle(motorcylce: motorcycle)
    }
}
