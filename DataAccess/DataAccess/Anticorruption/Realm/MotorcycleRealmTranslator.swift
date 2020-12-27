//
//  MotorcycleRealmTranslator.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//
import Domain

public class MotorcycleRealmTranslator {
    
    func fromModelToRealmEntity(motorcycle: Motorcycle) -> MotorcycleRealm{
        
        let realmEntity = MotorcycleRealm(
            cylinder: motorcycle.getCylinder(),
            vehicleLicense: motorcycle.getVehicleLicense()
        )
        
        return realmEntity
    }
}
