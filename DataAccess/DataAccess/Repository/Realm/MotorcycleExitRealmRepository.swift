//
//  MotorcycleExitRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Domain
import RealmSwift

public class MotorcycleExitRealmRepository: RealmRepository, MotorcycleExitRepository {
    
    public func saveMotorcycleExit(motoExit: MotorcycleExit) throws {
        
        let motoExitTranslator = MotorcycleExitRealmTranslator()
        let realm = try Realm(configuration: self.realmConfiguration)
        let motoRealm = motoExitTranslator.fromModelToRealm(motoExit: motoExit)
        
        try realm.write({
            realm.add(motoRealm, update: .modified)
            print("Moto salida.")
        })
    }
}
