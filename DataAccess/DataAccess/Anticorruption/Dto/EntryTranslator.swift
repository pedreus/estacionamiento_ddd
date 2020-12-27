//
//  EntryTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Foundation
import Domain

public class EntryTranslator {

    func fromDomainToDto(entry: Entry) -> EntryDto {
        var entryDto = EntryDto()
        entryDto.entryDateTime = self.fromDateToString(date: entry.getEntryDateTime())
        entryDto.weekDay = entry.getWeekDay()
        entryDto.cylinder = entry.getVehicle().getCylinder()
        entryDto.vehicleLicense = entry.getVehicle().getVehicleLicense()
        
        return entryDto
    }
    
    private func fromDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        
        return formatter.string(from: date)
    }
}
