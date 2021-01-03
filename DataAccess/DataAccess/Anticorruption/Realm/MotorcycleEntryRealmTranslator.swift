//
//  MotorcycleEntryRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import  Foundation
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
    
    func fromRealmEntityToModel(realmMoto: MotorcycleRealm) throws -> MotorcycleEntry {
        let moto = try Motorcycle(cylinder: realmMoto.getCylinder(), vehicleLicense: realmMoto.getVehicleLicense())
        let motoEntry = try MotorcycleEntry(entryDateTime: realmMoto.motoEntries.first?.getEntryDateTime() ?? Date(), motorcycle: moto)
        
        return motoEntry
    }
}
