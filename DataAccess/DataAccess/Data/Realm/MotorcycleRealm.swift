//
//  MotorcycleRealmEntity.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import RealmSwift

public class MotorcycleRealm: Object {
    
    @objc dynamic private var vehicleLicense: String = ""
    @objc dynamic private var cylinder: Int = 0
    
    public override static func primaryKey() -> String? {
        return "vehicleLicense"
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
