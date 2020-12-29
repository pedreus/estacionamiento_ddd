//
//  MotorcycleExitRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleExitRealmTranslator {
    
    func fromModelToRealm(motoExit: MotorcycleExit) -> MotorcycleRealm {
        
        let motorcycleRealm = MotorcycleRealm(
            cylinder: motoExit.getEntry().getVehicle().getCylinder(),
            vehicleLicense: motoExit.getEntry().getVehicle().getVehicleLicense()
        )
        let entryRealm = MotorcycleEntryRealm(
            entryDateTime: motoExit.getEntry().getEntryDateTime(),
            weeekDay: motoExit.getEntry().getWeekDay()
        )
        let exitRealm = MotorcycleExitRealm(
            exitDateTime: motoExit.getExitDateTime(),
            expendedTimeInDays: motoExit.getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: motoExit.getExpendedTimeInDaysAndHours().1 // Tupla (day, hour)
        )
        
        entryRealm.motoExit.append(exitRealm)
        motorcycleRealm.motoEntries.append(entryRealm)
        
        return motorcycleRealm
    }
}
