//
//  Exit.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import UIKit

public class Exit {
    
    private var exitDateTime: Date
    private var entry: Entry
    private var expendedTimeInDaysAndHours: (Int, Int)
    
    public init(exitDateTime: Date, entry: Entry) {
        self.exitDateTime = exitDateTime
        self.entry = entry
        self.expendedTimeInDaysAndHours = (0, 0)
        
        self.expendedTimeInDaysAndHours = self.calculateExpendedTimeInDaysAndHours()
    }
    
    /**
     Permite calcular el tiempo que usó el parqueadero en término de cantidad de horas.
     - Returns tipo Int, con el número de horas de uso del servicio de parqueadero.
     */
    private func calculateExpendedTimeInDaysAndHours() -> (Int, Int) {
        
        let currentCalendar = Calendar.current
        let numberOfDays = currentCalendar.dateComponents([.day, .hour], from: self.getEntry().getEntryDateTime(), to: self.getExitDateTime())
        let (days, hours) = (numberOfDays.day ?? 0, numberOfDays.hour ?? 0)
        let (aditionalDays, aditionalHours) = self.checkTopNumberOfHours(hours: hours)
        return ((days + aditionalDays), aditionalHours)
    }
    
    /**
     Verifica el número de horas de servicio. Si es superior a 9h se toma como un día
     - Parameter hours: número de horas
     - Returns tipo Int: Corresponde a la conversión por días
     */
    internal func checkTopNumberOfHours(hours: Int) -> (Int, Int) {
        if (hours > 9 && hours <= 24) {
            return (1, hours - 9)
        } else {
            return (0, hours)
        }
    }
    
    public func getExitDateTime() -> Date {
        return self.exitDateTime
    }
    
    public func getEntry() -> Entry {
        return self.entry
    }
    
    public func getExpendedTimeInDaysAndHours() -> (Int, Int) {
        return self.expendedTimeInDaysAndHours
    }
}
