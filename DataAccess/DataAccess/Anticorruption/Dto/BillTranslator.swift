//
//  BillTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Foundation
import Domain

public class BillTranslator {

    func fromDomainToDto(bill: Bill) -> BillDto {
        
        var billDto = BillDto()
        billDto.billDateTime = self.fromDateToString(date: bill.getBillDateTime())
        billDto.cost = bill.getCost()
        billDto.exitDateTime = self.fromDateToString(date: bill.getExit().getExitDateTime())
        billDto.expendedTimeInDays = bill.getExit().getExpendedTimeInDaysAndHours().0 // Tupla (day, hour)
        billDto.expendedTimeInHours = bill.getExit().getExpendedTimeInDaysAndHours().1 // Tupla (day, hour)
        billDto.entryDateTime = self.fromDateToString(date: bill.getExit().getEntry().getEntryDateTime())
        billDto.weekDay = bill.getExit().getEntry().getWeekDay()
        billDto.cylinder = bill.getExit().getEntry().getVehicle().getCylinder()
        billDto.vehicleLicense = bill.getExit().getEntry().getVehicle().getVehicleLicense()
        
        return billDto
    }
    
    private func fromDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        
        return formatter.string(from: date)
    }
}
