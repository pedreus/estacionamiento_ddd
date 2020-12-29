//
//  Vehicle.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import UIKit

public class Vehicle {
    private var cylinder: Int
    private var vehicleLicense: String
    
    public init(cylinder: Int, vehicleLicense: String) throws {
        self.cylinder = cylinder
        self.vehicleLicense = ""
        
        try self.setVehicleLicense(vehicleLicense: vehicleLicense)
    }
    
    private func isVehicleLicenseValidSize(vehicleLicense: String) -> Bool{
        if(vehicleLicense.count != 6) {
            return false
        }
        return true
    }
    private func isVehicleCynlinderValidSize(cylinder: Int) -> Bool {
        let cylinderString = String(cylinder)
        if (cylinderString.count < 5 && cylinderString.count > -1){
            return true
        } else {
            return false
        }
    }
    
    private func setVehicleCylinder(cylinder: Int) throws {
        if (!self.isVehicleCynlinderValidSize(cylinder: cylinder)) {
            throw BusinessError.IncorrectVehicleCylinder()
        }
        self.cylinder = cylinder
    }
    
    private func setVehicleLicense(vehicleLicense: String) throws {
        if (vehicleLicense.isEmpty) {
            throw BusinessError.EmptyVehicleLicense()
        }
        if(!self.isVehicleLicenseValidSize(vehicleLicense: vehicleLicense)) {
            throw BusinessError.IncorrectVehicleLicense()
        }
        self.vehicleLicense = vehicleLicense
    }
    
    public func getCylinder() -> Int {
        return self.cylinder
    }
    
    public func getVehicleLicense() -> String {
        return self.vehicleLicense
    }
}
