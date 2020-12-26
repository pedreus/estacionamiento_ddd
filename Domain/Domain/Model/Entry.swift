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
    private var weekDay: Int = 0
    
    public init(entryDateTime: Date, vehicle: Vehicle) {
        self.entryDateTime = entryDateTime
        self.vehicle = vehicle
        
        self.weekDay = getWeekDayFromEntryDateTime()
    }
    
    /**
     Permite obtener el día de la semana
     */
    private func getWeekDayFromEntryDateTime() -> Int {
        return Calendar.current.component(.weekday, from: self.entryDateTime)
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
