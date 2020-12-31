//
//  MotorcycleBillBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class MotorcycleBillBuilder: VehicleBillBuilder {
    
    func with(motoExit: MotorcycleExit) -> MotorcycleBillBuilder {
        return super.with(exit: motoExit) as! MotorcycleBillBuilder
    }
    
    override func build() throws -> MotorcycleBill {
        let unwrappedMotoExit: MotorcycleExit?
        if let motoExit = exit as? MotorcycleExit {
            unwrappedMotoExit = motoExit
        } else {
            unwrappedMotoExit = try MotorcycleExitBuilder().build()
        }
        
        return MotorcycleBill(billDateTime: billDate, motoExit: unwrappedMotoExit!)
    }
}
