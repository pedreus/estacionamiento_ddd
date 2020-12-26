//
//  ExitRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import Foundation

public protocol ExitRepository {
    
    /**
     - Parameter startTime: Corresponde a la hora de inicio del servicio de parqueadero.
     - Parameter endTime: Corresponde a la hora de salida y finalización del servicio de parqueadero.
     - Returns Tipo entero con la cantidad de horas de servicio de parqueadero.
     */
    func calculateExpendedTimeInHours(startTime: Date, endTime: Date) -> Int
    
    func getWeekDayFromDateForExit(date: Date)
    
    func saveExit(exit: Exit)
}
