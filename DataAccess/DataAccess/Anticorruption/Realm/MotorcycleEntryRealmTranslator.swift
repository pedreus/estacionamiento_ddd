//
//  MotorcycleEntryRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleEntryRealmTranslator {
    
    func fromModelToRealmEntity(entry: Entry) -> MotorcycleEntryRealm {
        
        let motorcycleRealm = MotorcycleRealm(
            cylinder: entry.getVehicle().getCylinder(),
            vehicleLicense: entry.getVehicle().getVehicleLicense()
        )
        let motorcycleEntryRealm = MotorcycleEntryRealm(
            entryDateTime: entry.getEntryDateTime(),
            weeekDay: entry.getWeekDay(),
            motorcycle: motorcycleRealm
        )
        
        return motorcycleEntryRealm
    }
}
