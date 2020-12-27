//
//  CarBillRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleBillRealmTranslator {
    
    func fromModelToRealm(bill: Bill) -> MotorcycleBillRealm {
        let motorcycleRealm = MotorcycleRealm(
            cylinder: bill.getExit().getEntry().getVehicle().getCylinder(),
            vehicleLicense: bill.getExit().getEntry().getVehicle().getVehicleLicense()
        )
        let motorcycleEntryRealm = MotorcycleEntryRealm(
            entryDateTime: bill.getExit().getEntry().getEntryDateTime(),
            weeekDay: bill.getExit().getEntry().getWeekDay(),
            motorcycle: motorcycleRealm
        )
        let motorcycleExitRealm = MotorcycleExitRealm(
            exitDateTime: bill.getExit().getExitDateTime(),
            expendedTimeInDays: bill.getExit().getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: bill.getExit().getExpendedTimeInDaysAndHours().1, // Tupla (day, hour)
            entryRealmEntity: motorcycleEntryRealm
        )
        let motorcycleBillRealm = MotorcycleBillRealm(billDateTime: bill.getBillDateTime(), cost: bill.getCost(), exit: motorcycleExitRealm)
        
        return motorcycleBillRealm
    }
}
