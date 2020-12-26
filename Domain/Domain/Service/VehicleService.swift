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
    
    func isValidVehicleLicenseForDay(vehicleLicense: String, weekDay: Int) throws -> Bool {
        if (weekDay < 1 || weekDay > 7) {
            throw BusinessError.IncorrectWeekDay()
        }
        if (vehicleLicense.isEmpty) {
            throw BusinessError.EmptyVehicleLicense()
        }
        return self.vehicleRepository.isValidVehicleLicenseForDay(vehicleLicense: vehicleLicense, weekDay: weekDay)
    }
    
    func isVehicleExists(vehicleLicense: String) throws -> Bool {
        if (vehicleLicense.isEmpty) {
            throw BusinessError.EmptyVehicleLicense()
        }
        return self.vehicleRepository.isVehicleExists(vehicleLicense: vehicleLicense)
    }
}
