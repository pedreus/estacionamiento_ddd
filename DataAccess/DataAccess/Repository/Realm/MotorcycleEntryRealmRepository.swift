//
//  MotorcycleEntryRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Domain
import RealmSwift

public class MotorcycleEntryRealmRepository: RealmRepository, MotorcycleEntryRepository {
    
    public func isValidMotorcyclesQuantity(maxQuantity: Int) throws -> Bool {
        let realm = try Realm(configuration: self.realmConfiguration)
        let motoEntries = realm.objects(MotorcycleEntryRealm.self)
        
        print("Cantidad: ", motoEntries.count, " Max: ", maxQuantity)
        return (motoEntries.count < maxQuantity);
    }
    
    public func saveMotorcycleEntry(motoEntry: MotorcycleEntry) throws {
        let realm = try Realm(configuration: self.realmConfiguration)
        let motorRealmTranslator = MotorcycleEntryRealmTranslator()
        let motoRealm = motorRealmTranslator.fromModelToRealmEntity(motoEntry: motoEntry)
        
        try realm.write({
            realm.add(motoRealm, update: .modified)
            print("Ingresó moto")
        })
    }
    
}
