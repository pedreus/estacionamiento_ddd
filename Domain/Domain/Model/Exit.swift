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
    private var expendedTimeInHours: Double = 0
    
    init(exitDateTime: Date, entry: Entry) {
        self.exitDateTime = exitDateTime
        self.entry = entry
        
        self.expendedTimeInHours = self.calculateExpendedTimeInHours()
    }
    
    /**
     Permite calcular el tiempo que usó el parqueadero en término de cantidad de horas.
     - Returns tipo Int, con el número de horas de uso del servicio de parqueadero.
     */
    private func calculateExpendedTimeInHours() -> Double {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: .minute, in: .era, for: self.entry.getEntryDateTime()) else { return -1 }
        guard let end = currentCalendar.ordinality(of: .minute, in: .era, for: self.getExitDateTime()) else { return -1 }
        
        let minutesBetweenDates = Double(end - start)
        let hoursBetweenDates = Double(minutesBetweenDates / 60)
        
        return hoursBetweenDates
    }
    
    public func getExitDateTime() -> Date {
        return self.exitDateTime
    }
    
    public func getEntry() -> Entry {
        return self.entry
    }
    
    public func getExpendedTimeInHours() -> Double {
        return self.expendedTimeInHours
    }
}
