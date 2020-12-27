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
    
    case VehicleLicenseUnauthorized(message: String = "La placa no está autorizada para ingresar este día.")
    case IncorrectWeekDay(message: String = "El día no es un día de la semana válido")
    case EmptyVehicleLicense(message: String = "La placa está vacía")
    case IncorrectVehicleLicense(message: String = "La placa del vehículo no es correcta.")
    case VehicleAlreadyExists(message: String = "El vehículo ya existe")
    case CarQuantityComplete(message: String = "No hay más cupos para carros.")
    case MotorcycleQuantityComplete(message: String = "No hay más cupos para motos.")
    case VehicleSaveError(message: String = "Error al guardar el vehículo")
}
