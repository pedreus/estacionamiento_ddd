//
//  MotorcycleExitBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class MotorcycleExitBuilder: VehicleExitBuilder {
    
    func with(motoEntry: MotorcycleEntry) -> MotorcycleExitBuilder {
        return super.with(entry: motoEntry) as! MotorcycleExitBuilder
    }
    
    override func build() throws -> MotorcycleExit {
        let unwrappedMotoEntry: MotorcycleEntry?
        if let motoEntry = entry as? MotorcycleEntry {
            unwrappedMotoEntry = motoEntry
        } else {
            unwrappedMotoEntry = try MotorcycleEntryBuilder().build()
        }
        
        return MotorcycleExit(exitDateTime: exitDate, motoEntry: unwrappedMotoEntry!)
    }
}
