//
//  CarRepositoryRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Domain
import RealmSwift

public class CarRealmRepository: RealmRepository, CarRepository {
    
    public func saveCar(car: Car) throws {
        let realm = try Realm(configuration: self.realmConfiguration)
        let carRealmTranslator = CarRealmTranslator()
        let carRealm = carRealmTranslator.fromModelToRealmEntity(car: car)
        
        try realm.write({
            realm.add(carRealm, update: .modified)
            print("Carro guardado")
        })
    }
    
    public func isVehicleExists(vehicleLicense: String) throws -> Bool {
        let realm = try Realm(configuration: self.realmConfiguration)
        if let _ = realm.objects(CarRealm.self).filter("vehicleLicense = '\(vehicleLicense)'").first {
            return true
        } else {
            return false
        }
    }
    
    
}
