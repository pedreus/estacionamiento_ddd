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
        let carEntries = realm.objects(CarEntryRealm.self).filter(NSPredicate(format: "carExit.@count = %d", 0))
        
        print("Cantidad: ", carEntries.count, " Max: ", maxQuantity)
        return (carEntries.count <= maxQuantity);
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
    
    public func getAllCarEntries() throws -> [CarEntry] {
        var carEntries = [CarEntry]()
        let carEntryRealmTranslator = CarEntryRealmTranslator()
        let realm = try Realm(configuration: self.realmConfiguration)
        let entries = realm.objects(CarRealm.self).filter(NSPredicate(format: "carEntries.carExit.@count = %d", 0))
        
        if (entries.count > 0) {
            for carRealm in entries {
                let carEntry = try carEntryRealmTranslator.fromRealmEntityToModel(realmCar: carRealm)
                carEntries.append(carEntry)
            }
        }
        
        return carEntries
    }
    
}
