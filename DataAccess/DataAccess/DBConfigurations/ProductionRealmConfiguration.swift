//
//  RealmConfiguration.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Foundation
import RealmSwift

public class ProductionRealmConfiguration: RealmConfig {
    
    var database = "estacionamiento.realm"
    
    public func gestProductionDataConfiguration() throws -> Realm.Configuration {
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
    
    public func deleteProductionDatabase() throws {
        let realmURL = try self.gestProductionDataConfiguration().fileURL!
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
