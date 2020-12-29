//
//  CarBillRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleBillRealmTranslator {
    
    func fromModelToRealm(motoBill: MotorcycleBill) -> MotorcycleRealm {
        let motorcycleRealm = MotorcycleRealm(
            cylinder: motoBill.getExit().getEntry().getVehicle().getCylinder(),
            vehicleLicense: motoBill.getExit().getEntry().getVehicle().getVehicleLicense()
        )
        let motorcycleEntryRealm = MotorcycleEntryRealm(
            entryDateTime: motoBill.getExit().getEntry().getEntryDateTime(),
            weeekDay: motoBill.getExit().getEntry().getWeekDay()
        )
        let motorcycleExitRealm = MotorcycleExitRealm(
            exitDateTime: motoBill.getExit().getExitDateTime(),
            expendedTimeInDays: motoBill.getExit().getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: motoBill.getExit().getExpendedTimeInDaysAndHours().1 // Tupla (day, hour)
        )
        let motorcycleBillRealm = MotorcycleBillRealm(
            billDateTime: motoBill.getBillDateTime(),
            cost: motoBill.getCost(),
            exit: motorcycleExitRealm
        )
        
        motorcycleExitRealm.motoBill.append(motorcycleBillRealm)
        motorcycleEntryRealm.motoExit.append(motorcycleExitRealm)
        motorcycleRealm.motoEntries.append(motorcycleEntryRealm)
        
        return motorcycleRealm
    }
}
