//
//  VehicleRealmEntity.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

/**
 Tipo de vehículo:
 1: carro
 2: moto
 */

import RealmSwift

public class CarRealm: Object {
    
    @objc dynamic private var vehicleLicense: String = ""
    @objc dynamic private var cylinder: Int = 0
    
    public override static func primaryKey() -> String? {
        return "vehicleLicense"
    }
    
    public override class func indexedProperties() -> [String] {
        return ["vehicleLicense"]
    }
    
    convenience init(cylinder: Int, vehicleLicense: String) {
        self.init()
        self.cylinder = cylinder
        self.vehicleLicense = vehicleLicense
    }
    
    public func getVehicleLicense() -> String {
        return self.vehicleLicense
    }
    
    public func getCylinder() -> Int {
        return self.cylinder
    }
}
