//
//  VehicleRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//
import Domain

public class CarRealmTranslator {
    
    func fromModelToRealmEntity(car: Car) -> CarRealm {
        
        let realmEntity = CarRealm(
            cylinder: car.getCylinder(),
            vehicleLicense: car.getVehicleLicense()
        )
        
        return realmEntity
    }
}
