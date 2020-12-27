//
//  ExitRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class CarExitRealmTranslator {
    
    func fromModelToRealmEntity(exit: Exit) -> CarExitRealm {
        
        let carRealm = CarRealm(
            cylinder: exit.getEntry().getVehicle().getCylinder(),
            vehicleLicense: exit.getEntry().getVehicle().getVehicleLicense()
        )
        let carEntryRealm = CarEntryRealm(
            entryDateTime: exit.getEntry().getEntryDateTime(),
            weeekDay: exit.getEntry().getWeekDay(),
            car: carRealm
        )
        let carExitRealm = CarExitRealm(
            exitDateTime: exit.getExitDateTime(),
            expendedTimeInDays: exit.getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: exit.getExpendedTimeInDaysAndHours().1, // Tupla (day, hour)
            entryRealmEntity: carEntryRealm
        )
        
        return carExitRealm
    }
}
