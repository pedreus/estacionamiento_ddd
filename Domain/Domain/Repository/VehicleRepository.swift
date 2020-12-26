//
//  VehicleRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import Foundation

public protocol VehicleRepository {
    
    /**
     Valida si la placa puede ingresar un día de la semana específico
     - Parameter vehicleLicense: Corresponde a la placa del vehículo que va a ingresar.
     - Parameter weekDay: Corresponde al día de la semana con el cual se quiere validar. Domingo 1, Lunes 2, etc.
     - Returns Tipo Bool True para decir que la placa es válida y False en caso contrario.
     */
    func isValidVehicleLicenseForDay(vehicleLicense: String, weekDay: Int) -> Bool
    
    /**
     Valida si una placa de un vehículo ya existe
     - Parameter vehicleLicense: Corresponde a la placa del vehículo.
     - Returns tipo Bool, True si existe o False en caso contrario.
     */
    func isVehicleExists(vehicleLicense: String) -> Bool
    
}
