//
//  VehicleTranlator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Domain

public class CarTranlator {

    func fromDomainToDto (car: Car) -> CarDto {
        var carDto = CarDto()
        carDto.cylinder = car.getCylinder()
        carDto.vehicleLicense = car.getVehicleLicense()
        
        return carDto
    }
}
