//
//  ExitRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class CarExitRealmTranslator {
    
    func fromModelToRealmEntity(carExit: CarExit) -> CarRealm {
        
        let carRealm = CarRealm(
            cylinder: carExit.getEntry().getVehicle().getCylinder(),
            vehicleLicense: carExit.getEntry().getVehicle().getVehicleLicense()
        )
        let carEntryRealm = CarEntryRealm(
            entryDateTime: carExit.getEntry().getEntryDateTime(),
            weeekDay: carExit.getEntry().getWeekDay()
        )
        let carExitRealm = CarExitRealm(
            exitDateTime: carExit.getExitDateTime(),
            expendedTimeInDays: carExit.getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: carExit.getExpendedTimeInDaysAndHours().1 // Tupla (day, hour)
        )
        
        carEntryRealm.carExit.append(carExitRealm)
        carRealm.carEntries.append(carEntryRealm)
        
        return carRealm
    }
}
