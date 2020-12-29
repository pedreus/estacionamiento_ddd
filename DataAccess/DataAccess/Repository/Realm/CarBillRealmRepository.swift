//
//  CarBillRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

import Domain
import RealmSwift

public class CarBillRealmRepository: RealmRepository, CarBillRepository {
    
    public func saveCarBill(carBill: CarBill) throws {
        let carBillTranslator = CarBillRealmTranslator()
        let carRealm = carBillTranslator.fromModelToRealm(carBill: carBill)
        let realm = try Realm(configuration: self.realmConfiguration)
        
        try realm.write({
            realm.add(carRealm, update: .modified)
            print("Factura carro. Costo: ", carRealm.carEntries.first?.carExit.first?.carBill.first?.getCost() ?? 0)
        })
    }
}
