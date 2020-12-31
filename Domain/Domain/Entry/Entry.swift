//
//  Entry.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import UIKit

public class Entry {
    
    private var entryDateTime: Date
    private var vehicle: Vehicle
    private var weekDay: Int
    
    public init(entryDateTime: Date, vehicle: Vehicle) throws {
        self.entryDateTime = entryDateTime
        self.vehicle = vehicle
        self.weekDay = 0
        
        self.weekDay = try getValidWeekDayFromEntryDateTime()
    }
    
    /**
     Permite obtener el día de la semana
     */
    private func getValidWeekDayFromEntryDateTime() throws -> Int {
        let validWeekDay = Calendar.current.component(.weekday, from: self.entryDateTime)
        if (try !isValidVehicleLicenseForDay(validWeedDay: validWeekDay)){
            throw BusinessError.VehicleLicenseUnauthorized()
        }
        return validWeekDay
    }
    
    /**
     Permite validar si la placa de un vehículo está permitida el día de ingreso
     Aquellos que empiezan por la A, ingresan solo domingo y lunes
     */
    private func isValidVehicleLicenseForDay(validWeedDay: Int) throws -> Bool {
        
        if (validWeedDay < 1 || validWeedDay > 7) {
            throw BusinessError.IncorrectWeekDay()
        }
        
        let firstLicenseLetter = self.vehicle.getVehicleLicense().first?.uppercased()
        if ((firstLicenseLetter == "A" && (validWeedDay == 1 || validWeedDay == 2)) || firstLicenseLetter != "A") {
            return true
        } else {
            return false
        }
    }
    
    public func getVehicle() -> Vehicle {
        return self.vehicle
    }
    
    public func getEntryDateTime() -> Date {
        return self.entryDateTime
    }
    
    public func getWeekDay() -> Int {
        return self.weekDay
    }
    
}
