//
//  CarExitRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//
import Domain
import RealmSwift

public class CarExitRealmRepository: RealmRepository, CarExitRepository {
    
    public func saveCarExit(carExit: CarExit) throws {
        
        let carExitRealmTranslator = CarExitRealmTranslator()
        let carRealm = carExitRealmTranslator.fromModelToRealmEntity(carExit: carExit)
        let realm = try Realm(configuration: self.realmConfiguration)
        
        try realm.write({
            realm.add(carRealm, update: .modified)
            print("Salida de carro")
        })
        
    }
}
