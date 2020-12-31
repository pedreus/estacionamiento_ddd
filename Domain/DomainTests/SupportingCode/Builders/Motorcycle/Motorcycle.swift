//
//  Motorcycle.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

@testable import Domain

public class MotorcycleBuilder: VehicleBuilder {
    
    override func build() throws -> Motorcycle {
        return try Motorcycle(cylinder: cylinder, vehicleLicense: license)
    }
}
