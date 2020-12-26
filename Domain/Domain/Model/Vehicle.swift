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
    
    init(cylinder: Int, vehicleLicense: String) {
        self.cylinder = cylinder
        self.vehicleLicense = vehicleLicense
    }
    
    public func getCylinder() -> Int {
        return self.cylinder
    }
    
    public func getVehicleLicense() -> String {
        return self.vehicleLicense
    }
}
