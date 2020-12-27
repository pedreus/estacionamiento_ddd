//
//  CarBillRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class CarBillRealmTranslator {
    
    func fromModelToRealm(bill: Bill) -> CarBillRealm {
        let carRealm = CarRealm(
            cylinder: bill.getExit().getEntry().getVehicle().getCylinder(),
            vehicleLicense: bill.getExit().getEntry().getVehicle().getVehicleLicense()
        )
        let carEntryRealm = CarEntryRealm(
            entryDateTime: bill.getExit().getEntry().getEntryDateTime(),
            weeekDay: bill.getExit().getEntry().getWeekDay(),
            car: carRealm
        )
        let carExitRealm = CarExitRealm(
            exitDateTime: bill.getExit().getExitDateTime(),
            expendedTimeInDays: bill.getExit().getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: bill.getExit().getExpendedTimeInDaysAndHours().1, // Tupla (day, hour)
            entryRealmEntity: carEntryRealm
        )
        let carBillRealm = CarBillRealm(billDateTime: bill.getBillDateTime(), cost: bill.getCost(), exit: carExitRealm)
        
        return carBillRealm
    }
}
