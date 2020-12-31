//
//  RealmConfigTest.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 30/12/20.
//

import Foundation
import RealmSwift

public class TestRealmConfiguration: RealmConfig {
    
    var database = "test.realm"
    
    public func getTestDataConfiguration() throws -> Realm.Configuration {
        try self.checkDirectory()
        
        var config = Realm.Configuration()
        config.fileURL = self.dataPath.appendingPathComponent(self.database)
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            if (oldSchemaVersion < config.schemaVersion){
            }
        }
        return config
    }
    
    public func deleteTestDatabase() throws {
        let realmURL = try self.getTestDataConfiguration().fileURL!
        let realmURLs = [
            realmURL,
            realmURL.appendingPathExtension("lock"),
            realmURL.appendingPathExtension("note"),
            realmURL.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            try FileManager.default.removeItem(at: URL)
        }
    }
}
