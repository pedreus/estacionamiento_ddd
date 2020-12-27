//
//  ExitRealmEntity.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import Foundation
import RealmSwift

public class CarExitRealm: Object {
    
    @objc dynamic private var id: String = ""
    @objc dynamic private var exitDateTime: Date = Date()
    @objc dynamic private var expendedTimeInDays: Int = 0
    @objc dynamic private var expendedTimeInHours: Int = 0
    @objc dynamic private var entryRealmEntity: CarEntryRealm?
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(exitDateTime: Date, expendedTimeInDays: Int, expendedTimeInHours: Int, entryRealmEntity: CarEntryRealm) {
        self.init()
        self.id = UUID().uuidString
        self.exitDateTime = exitDateTime
        self.expendedTimeInDays = expendedTimeInDays
        self.expendedTimeInHours = expendedTimeInHours
        self.entryRealmEntity = entryRealmEntity
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
    
    public func getEntryRealmEntity() -> CarEntryRealm? {
        return self.entryRealmEntity
    }
}
