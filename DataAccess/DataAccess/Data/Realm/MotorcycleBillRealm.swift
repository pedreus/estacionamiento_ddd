//
//  CarBillRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Foundation
import RealmSwift

public class MotorcycleBillRealm: Object {
    
    @objc dynamic private var id: String = ""
    @objc dynamic private var billDateTime: Date = Date()
    @objc dynamic private var cost: Int = 0
    @objc dynamic private var exit: MotorcycleExitRealm?
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(billDateTime: Date, cost: Int, exit: MotorcycleExitRealm) {
        self.init()
        self.id = UUID().uuidString
        self.billDateTime = billDateTime
        self.cost = cost
        self.exit = exit
    }
    
    public func getBillDateTime() -> Date {
        return self.billDateTime
    }
    
    public func getCost() -> Int {
        return self.cost
    }
    
    public func getCarExitRealm() -> MotorcycleExitRealm? {
        return self.exit
    }
}
