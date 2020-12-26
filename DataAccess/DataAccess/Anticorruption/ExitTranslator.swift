//
//  ExitTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Foundation
import Domain

public class ExitTranslator {
    
    func fromDomainToDto(exit: Exit) -> ExitDto {
        var exitDto = ExitDto()
        exitDto.exitDateTime = self.fromDateToString(date: exit.getExitDateTime())
        exitDto.expendedTimeInHours = exit.getExpendedTimeInHours()
        exitDto.entryDateTime = self.fromDateToString(date: exit.getEntry().getEntryDateTime())
        exitDto.weekDay = exit.getEntry().getWeekDay()
        exitDto.cylinder = exit.getEntry().getVehicle().getCylinder()
        exitDto.vehicleLicense = exit.getEntry().getVehicle().getVehicleLicense()
        
        return exitDto
    }
    
    private func fromDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        
        return formatter.string(from: date)
    }
}
