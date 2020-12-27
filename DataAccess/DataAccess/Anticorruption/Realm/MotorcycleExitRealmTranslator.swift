//
//  MotorcycleExitRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleExitRealmTranslator {
    
    func fromModelToRealm(exit: Exit) -> MotorcycleExitRealm {
        
        let motorcycleRealm = MotorcycleRealm(
            cylinder: exit.getEntry().getVehicle().getCylinder(),
            vehicleLicense: exit.getEntry().getVehicle().getVehicleLicense()
        )
        let entryRealm = MotorcycleEntryRealm(
            entryDateTime: exit.getEntry().getEntryDateTime(),
            weeekDay: exit.getEntry().getWeekDay(),
            motorcycle: motorcycleRealm
        )
        let exitRealm = MotorcycleExitRealm(
            exitDateTime: exit.getExitDateTime(),
            expendedTimeInDays: exit.getExpendedTimeInDaysAndHours().0, // Tupla (day, hour)
            expendedTimeInHours: exit.getExpendedTimeInDaysAndHours().1, // Tupla (day, hour)
            entryRealmEntity: entryRealm)
        
        return exitRealm
    }
}
