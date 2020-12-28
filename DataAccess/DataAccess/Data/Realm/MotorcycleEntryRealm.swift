//
//  MotorcycleEntryRealmEntity.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 26/12/20.
//

import RealmSwift

public class MotorcycleEntryRealm: Object {
    
    @objc dynamic private var id: String = ""
    @objc dynamic private var entryDateTime: Date = Date()
    @objc dynamic private var weekDay: Int = 0
    @objc dynamic private var motorcycle: MotorcycleRealm?
    
    public override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(entryDateTime: Date, weeekDay: Int, motorcycle: MotorcycleRealm) {
        self.init()
        self.id = UUID().uuidString
        self.entryDateTime = entryDateTime
        self.weekDay = weeekDay
        self.motorcycle = motorcycle
    }
    
    public func getEntryDateTime() -> Date {
        return self.entryDateTime
    }
    
    public func getWeekDay() -> Int {
        return self.weekDay
    }
    
    public func getMotorcycleRealm() -> MotorcycleRealm? {
        return self.motorcycle
    }
}
