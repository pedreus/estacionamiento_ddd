//
//  Bill.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 22/12/20.
//

import UIKit

public class Bill {

    private var billDateTime: Date
    private var cost: Int
    private var exit: Exit
    
    public init(billDateTime: Date, exit: Exit) {
        self.billDateTime = billDateTime
        self.cost = 0
        self.exit = exit
    }
    
    internal func setCost(cost: Int) {
        self.cost = cost
    }
    
    public func getBillDateTime() -> Date {
        return self.billDateTime
    }
    
    public func getCost() -> Int {
        return self.cost
    }
    
    public func getExit() -> Exit {
        return self.exit
    }
}
