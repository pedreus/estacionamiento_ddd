//
//  CarBillRealm.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

// Realm Versión 0

import Foundation
import RealmSwift

public class CarBillRealm: Object {
    
    @objc dynamic private var id: String = ""
    @objc dynamic private var billDateTime: Date = Date()
    @objc dynamic private var cost: Int = 0
    @objc dynamic private var exit: CarExitRealm? {
        return LinkingObjects(fromType: CarExitRealm.self, property: "carBill").first
    }
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(billDateTime: Date, cost: Int) {
        self.init()
        self.id = UUID().uuidString
        self.billDateTime = billDateTime
        self.cost = cost
    }
    
    public func getBillDateTime() -> Date {
        return self.billDateTime
    }
    
    public func getCost() -> Int {
        return self.cost
    }
    
    public func getCarExitRealm() -> CarExitRealm? {
        return self.exit
    }
}
