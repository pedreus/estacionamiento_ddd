//
//  CarExitBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class CarExitBuilder: VehicleExitBuilder {
    
    func with(carEntry: CarEntry) -> CarExitBuilder {
        return super.with(entry: carEntry) as! CarExitBuilder
    }
    
    override func build() throws -> CarExit {
        let unwrappedCarEntry: CarEntry?
        if let carEntry = entry as? CarEntry {
            unwrappedCarEntry = carEntry
        } else {
            unwrappedCarEntry = try CarEntryBuilder().build()
        }
        
        return CarExit(exitDateTime: exitDate, carEntry: unwrappedCarEntry!)
    }
}
