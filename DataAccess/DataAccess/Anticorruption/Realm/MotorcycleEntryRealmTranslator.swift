//
//  MotorcycleEntryRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Domain

public class MotorcycleEntryRealmTranslator {
    
    func fromModelToRealmEntity(motoEntry: MotorcycleEntry) -> MotorcycleRealm {
        
        let motorcycleRealm = MotorcycleRealm(
            cylinder: motoEntry.getVehicle().getCylinder(),
            vehicleLicense: motoEntry.getVehicle().getVehicleLicense()
        )
        let motorcycleEntryRealm = MotorcycleEntryRealm(
            entryDateTime: motoEntry.getEntryDateTime(),
            weeekDay: motoEntry.getWeekDay()
        )
        
        motorcycleRealm.motoEntries.append(motorcycleEntryRealm)
        
        return motorcycleRealm
    }
}
