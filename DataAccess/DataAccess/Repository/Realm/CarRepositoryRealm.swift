//
//  CarRepositoryRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 24/12/20.
//

import Domain
import RealmSwift

public class CarRepositoryRealm: CarRepository {
    
    public func isValidCarsQuantity() -> Bool {
        true
    }
    
    public func saveCar(car: Car) {
        print("Carro guardado")
    }
    
    public func isVehicleExists(vehicleLicense: String) -> Bool {
        false
    }
    

}
