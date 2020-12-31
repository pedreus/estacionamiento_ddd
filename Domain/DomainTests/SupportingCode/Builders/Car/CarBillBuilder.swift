//
//  CarBillBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class CarBillBuilder: VehicleBillBuilder {
    
    func with(carExit: CarExit) -> CarBillBuilder {
        return super.with(exit: carExit) as! CarBillBuilder
    }
    
    override func build() throws -> CarBill {
        let unwrappedCarExit: CarExit?
        if let carExit = exit as? CarExit {
            unwrappedCarExit = carExit
        } else {
            unwrappedCarExit = try CarExitBuilder().build()
        }
        
        return CarBill(billDateTime: billDate, carExit: unwrappedCarExit!)
    }
}
