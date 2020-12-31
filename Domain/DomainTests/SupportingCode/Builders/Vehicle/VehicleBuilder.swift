//
//  VehicleBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

@testable import Domain

public class VehicleBuilder {
    
    var cylinder: Int = 1000
    var license: String = "abc123"
    
    func with(cylinder: Int) -> VehicleBuilder {
        self.cylinder = cylinder
        return self
    }
    
    func with(license: String) -> VehicleBuilder {
        self.license = license
        return self
    }
    
    func build() throws -> Vehicle {
        return try Vehicle(cylinder: cylinder, vehicleLicense: license)
    }
}
