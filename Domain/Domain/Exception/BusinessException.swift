//
//  BusinessException.swift
//  Domain
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 23/11/20.
//

public enum BusinessError: Error {
    
    case EmptyRoles(message: String = "Debe tener al menos un rol.")
    case PersonAlreadyExists(message: String = "La persona ya existe.")
    case WrongEmail(message: String = "El email tiene un formato incorrecto.")
    case WrongPassword(message: String = "El password no tiene el formato correcto.")
    
    case IncorrectWeekDay(message: String = "El día no es un día de la semana válido")
    case EmptyVehicleLicense(message: String = "La placa está vacía")
    case VehicleAlreadyExists(message: String = "El vehículo ya existe")
    case CarQuantityComplete(message: String = "No hay más cupos para carros.")
    case MotorcycleQuantityComplete(message: String = "No hay más cupos para motos.")
}
