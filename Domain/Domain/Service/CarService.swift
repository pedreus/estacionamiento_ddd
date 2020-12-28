//
//  CarService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import UIKit

public class CarService: VehicleService {

    var carRepository: CarRepository
    
    public init(carRepository: CarRepository) {
        self.carRepository = carRepository
        super.init(vehicleRepository: self.carRepository)
    }
    
    func isValidCarQuantity() throws -> Bool {
        return try self.carRepository.isValidCarsQuantity()
    }
    
    func saveCar(car: Car) throws {
        if (try self.carRepository.isVehicleExists(vehicleLicense: car.getVehicleLicense())) {
            throw BusinessError.VehicleAlreadyExists()
        }
        try self.carRepository.saveCar(car: car)
    }
}
