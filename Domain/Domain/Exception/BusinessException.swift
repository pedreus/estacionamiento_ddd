//
//  BusinessException.swift
//  Domain
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 23/11/20.
//
import Foundation

public enum BusinessError: Error {
    
    case EmptyRoles(message: String = "Debe tener al menos un rol.")
    case PersonAlreadyExists(message: String = "La persona ya existe.")
    case WrongEmail(message: String = "El email tiene un formato incorrecto.")
    case WrongPassword(message: String = "El password no tiene el formato correcto.")
    
    case VehicleLicenseUnauthorized(message: String = "La placa no está autorizada para ingresar el día de hoy.")
    case IncorrectWeekDay(message: String = "El día no es un día de la semana válido")
    case EmptyVehicleLicense(message: String = "La placa no puede estar vacía")
    case EmptyVehicleCylinder(message: String = "El cilindraje no puede estar vacío")
    case IncorrectVehicleLicense(message: String = "La placa del vehículo no es correcta.")
    case IncorrectVehicleCylinder(message: String = "El cilindraje del vehículo no es correcto.")
    case VehicleAlreadyExists(message: String = "El vehículo ya existe")
    case CarQuantityComplete(message: String = "No hay más cupos para carros.")
    case MotorcycleQuantityComplete(message: String = "No hay más cupos para motos.")
    case VehicleSaveError(message: String = "Error al guardar el vehículo")
    case WrongNumericTextEntry(message: String = "No se permiten caracteres diferentes a números.")
    case WrongAlphanumericTextEntry(message: String = "No se permiten caracteres diferentes a números y letras.")
    case WrongVehicleType(message: String = "El tipo de vehículo no está permitido")
}
