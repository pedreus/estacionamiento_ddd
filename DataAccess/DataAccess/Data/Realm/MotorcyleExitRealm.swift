//
//  ExitRealmEntity.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

// Realm Versión 0

import Foundation
import RealmSwift

public class MotorcycleExitRealm: Object {
    
    @objc dynamic private var id: String = UUID().uuidString
    @objc dynamic private var exitDateTime: Date = Date()
    @objc dynamic private var expendedTimeInDays: Int = 0
    @objc dynamic private var expendedTimeInHours: Int = 0
    @objc dynamic private var entryRealmEntity: MotorcycleEntryRealm? {
        return LinkingObjects(fromType: MotorcycleEntryRealm.self, property: "motoExit").first
    }
    
    let motoBill = List<MotorcycleBillRealm>()
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(exitDateTime: Date, expendedTimeInDays: Int, expendedTimeInHours: Int) {
        self.init()
        self.exitDateTime = exitDateTime
        self.expendedTimeInDays = expendedTimeInDays
        self.expendedTimeInHours = expendedTimeInHours
    }
    
    public func getExitDateTime() -> Date {
        return self.exitDateTime
    }
    
    public func getExpendedTimeInDays() -> Int {
        return self.expendedTimeInDays
    }
    
    public func getExpendedTimeInHours() -> Int {
        return self.expendedTimeInHours
    }
    
    public func getEntryRealmEntity() -> MotorcycleEntryRealm? {
        return self.entryRealmEntity
    }
}
