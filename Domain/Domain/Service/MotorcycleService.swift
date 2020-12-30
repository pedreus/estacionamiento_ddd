//
//  MotorcycleService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

public class MotorcycleService: VehicleService {
    
    var motorcycleRepository: MotorcycleRepository
    
    public init(motorcycleRepository: MotorcycleRepository) {
        self.motorcycleRepository = motorcycleRepository
        super.init(vehicleRepository: self.motorcycleRepository)
    }
    
    public func saveMotorcycle(motorcycle: Motorcycle) throws {
        if (try self.isVehicleExists(vehicleLicense: motorcycle.getVehicleLicense())) {
            throw BusinessError.VehicleAlreadyExists()
        }
        try self.motorcycleRepository.saveMotorcycle(motorcylce: motorcycle)
    }
}
