//
//  EntryRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//
import Domain

public class CarEntryRealmTranslator {
    
    func fromModelToRealmEntity(carEntry: CarEntry) -> CarRealm {
        let carRealm = CarRealm(
            cylinder: carEntry.getVehicle().getCylinder(),
            vehicleLicense: carEntry.getVehicle().getVehicleLicense()
        )
        let carEntry = CarEntryRealm(
            entryDateTime: carEntry.getEntryDateTime(),
            weeekDay: carEntry.getWeekDay()
        )
        
        carRealm.carEntries.append(carEntry)
        
        return carRealm
    }
    
}
