//
//  CarBillRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class CarBillRealmTranslator {
    
    func fromModelToRealm(carBill: CarBill) -> CarRealm {
        let carRealm = CarRealm(
            cylinder: carBill.getExit().getEntry().getVehicle().getCylinder(),
            vehicleLicense: carBill.getExit().getEntry().getVehicle().getVehicleLicense()
        )
        let carEntryRealm = CarEntryRealm(
            entryDateTime: carBill.getExit().getEntry().getEntryDateTime(),
            weeekDay: carBill.getExit().getEntry().getWeekDay()
        )
        let carExitRealm = CarExitRealm(
            exitDateTime: carBill.getExit().getExitDateTime(),
            expendedTimeInDays: carBill.getExit().getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: carBill.getExit().getExpendedTimeInDaysAndHours().1 // Tupla (day, hour)
        )
        let carBillRealm = CarBillRealm(
            billDateTime: carBill.getBillDateTime(),
            cost: carBill.getCost()
        )
        
        carExitRealm.carBill.append(carBillRealm)
        carEntryRealm.carExit.append(carExitRealm)
        carRealm.carEntries.append(carEntryRealm)
        
        return carRealm
    }
}
