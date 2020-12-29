//
//  VehicleRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

public protocol VehicleRepository {
    
    /**
     Valida si una placa de un vehículo ya existe
     - Parameter vehicleLicense: Corresponde a la placa del vehículo.
     - Returns tipo Bool, True si existe o False en caso contrario.
     */
    func isVehicleExists(vehicleLicense: String) throws -> Bool
    
}
