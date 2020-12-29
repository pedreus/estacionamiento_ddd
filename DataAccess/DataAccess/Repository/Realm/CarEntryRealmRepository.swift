//
//  CarEntryRealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//
import Domain
import RealmSwift

public class CarEntryRealmRepository: RealmRepository, CarEntryRepository {
    
    
    public func isValidCarsQuantity(maxQuantity: Int) throws -> Bool {
        
        let realm = try Realm(configuration: self.realmConfiguration)
        let carEntries = realm.objects(CarEntryRealm.self)
        
        print("Cantidad: ", carEntries.count, " Max: ", maxQuantity)
        return (carEntries.count < maxQuantity);
    }
    
    public func saveCarEntry(carEntry: CarEntry) throws {
        
        let carEntryRealmTranslator = CarEntryRealmTranslator()
        let carRealm = carEntryRealmTranslator.fromModelToRealmEntity(carEntry: carEntry)
        let realm = try Realm(configuration: self.realmConfiguration)
        
        try realm.write({
            realm.add(carRealm, update: .modified)
            print("Ingreso Carro")
        })
    }
    
}
