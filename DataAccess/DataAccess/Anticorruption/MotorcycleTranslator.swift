//
//  MotorcycleTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Domain

public class MotorcycleTranslator {
    func fromDomainToDto (motorcycle: Motorcycle) -> MotorcycleDto {
        var motorcycleDto = MotorcycleDto()
        motorcycleDto.cylinder = motorcycle.getCylinder()
        motorcycleDto.vehicleLicense = motorcycle.getVehicleLicense()
        
        return motorcycleDto
    }
}
