//
//  VehicleService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import UIKit

public class VehicleService: NSObject {

    var vehicleRepository: VehicleRepository
    
    public init(vehicleRepository: VehicleRepository) {
        self.vehicleRepository = vehicleRepository
    }        
    
    func isVehicleExists(vehicleLicense: String) throws -> Bool {
        if (vehicleLicense.isEmpty) {
            throw BusinessError.EmptyVehicleLicense()
        }
        return self.vehicleRepository.isVehicleExists(vehicleLicense: vehicleLicense)
    }
}
