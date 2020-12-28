//
//  CarRepositoryRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Domain
import RealmSwift

public class CarRepositoryRealm: CarRepository {
    
    let realmConfig = Realm.Configuration(
        // Get the URL to the bundled file
        fileURL: Bundle.main.url(forResource: "Test", withExtension: "realm"),
        // Open the file in read-only mode as application bundles are not writeable
        readOnly: false
    )
    
    public func isValidCarsQuantity() throws -> Bool {
        true
    }
    
    public func saveCar(car: Car) throws {
        let realm = try Realm(configuration: realmConfig)
        let carRealmTranslator = CarRealmTranslator()
        let carRealm = carRealmTranslator.fromModelToRealmEntity(car: car)
        try realm.write({
            realm.add(carRealm)
            print("Carro guardado")
        })
    }
    
    public func isVehicleExists(vehicleLicense: String) throws -> Bool {
        let realm = try Realm(configuration: realmConfig)
        if let _ = realm.objects(CarRealm.self).filter("vehicleLicense = '\(vehicleLicense)'").first {
            return true
        } else {
            return false
        }
    }
    
    
}
