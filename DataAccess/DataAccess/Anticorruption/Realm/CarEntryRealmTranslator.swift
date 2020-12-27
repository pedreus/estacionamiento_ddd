//
//  EntryRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//
import Domain

public class CarEntryRealmTranslator {
    
    func fromModelToRealmEntity(entry: Entry) -> CarEntryRealm {
        let carRealmEntity = CarRealm(
            cylinder: entry.getVehicle().getCylinder(),
            vehicleLicense: entry.getVehicle().getVehicleLicense()
        )
        let realmEntity = CarEntryRealm(
            entryDateTime: entry.getEntryDateTime(),
            weeekDay: entry.getWeekDay(),
            car: carRealmEntity
        )
        
        return realmEntity
    }
    
}
