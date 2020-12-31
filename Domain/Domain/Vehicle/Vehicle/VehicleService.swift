//
//  VehicleService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

public class VehicleService {

    var vehicleRepository: VehicleRepository
    
    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }        
    
    public func isVehicleExists(vehicleLicense: String) throws -> Bool {
        if (vehicleLicense.isEmpty) {
            throw BusinessError.EmptyVehicleLicense()
        }
        return try self.vehicleRepository.isVehicleExists(vehicleLicense: vehicleLicense)
    }
}
