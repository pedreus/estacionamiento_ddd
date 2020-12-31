//
//  CarBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

@testable import Domain

public class CarBuilder: VehicleBuilder {
    
    override func build() throws -> Car {
        return try Car(cylinder: cylinder, vehicleLicense: license)
    }
}
