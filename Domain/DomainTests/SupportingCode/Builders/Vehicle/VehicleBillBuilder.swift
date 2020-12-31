//
//  CarBillBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class VehicleBillBuilder {
    
    var billDate: Date = Date()
    var cost: Int = 0
    var exit: Exit? = nil
    
    func with(billDate: Date) -> VehicleBillBuilder {
        self.billDate = billDate
        return self
    }
    
    func with(cost: Int) -> VehicleBillBuilder {
        self.cost = cost
        return self
    }
    
    func with(exit: Exit) -> VehicleBillBuilder {
        self.exit = exit
        return self
    }
    
    func build() throws -> Bill {
        let unwrappedExit: Exit?
        if let exit = exit {
            unwrappedExit = exit
        } else {
            unwrappedExit = try VehicleExitBuilder().build()
        }
        
        return Bill(billDateTime: billDate, exit: unwrappedExit!)
    }
}
