//
//  MotorcycleRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Domain
import RealmSwift

public class MotorcycleRealmRepository: RealmRepository, MotorcycleRepository {
    
    public func saveMotorcycle(motorcylce: Motorcycle) throws {
        let realm = try Realm(configuration: self.realmConfiguration)
        let realmTranslator = MotorcycleRealmTranslator()
        let realmMotorcycle = realmTranslator.fromModelToRealmEntity(motorcycle: motorcylce)
        
        try realm.write({
            realm.add(realmMotorcycle, update: .modified)
            print("Motocicleta Guardada")
        })
        
    }
    
    public func isVehicleExists(vehicleLicense: String) throws -> Bool {
        let realm = try Realm(configuration: self.realmConfiguration)
        if let _ = realm.objects(MotorcycleRealm.self).filter("vehicleLicense = '\(vehicleLicense)'").first {
            return true
        } else {
            return false
        }
    }
    
    
}
