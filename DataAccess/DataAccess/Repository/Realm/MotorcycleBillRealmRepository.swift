//
//  MotorcycleBillRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

import Domain
import RealmSwift

public class MotorcycleBillRealmRepository: RealmRepository, MotorcycleBillRepository {
    
    public func saveMotorcycleBill(motoBill: MotorcycleBill) throws {
        let motoBillTranslator = MotorcycleBillRealmTranslator()
        let motoRealm = motoBillTranslator.fromModelToRealm(motoBill: motoBill)
        let realm = try Realm(configuration: self.realmConfiguration)
        
        try realm.write({
            realm.add(motoRealm)
            print("Factura moto.", motoRealm.motoEntries.first?.motoExit.first?.motoBill.first?.getCost() ?? 0)
        })
    }
}
