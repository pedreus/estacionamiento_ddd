//
//  RealmConfiguration.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Foundation
import RealmSwift

public class RealmConfiguration {
    
    // Create "default.realm" in document file
    public static var defaultDataConfiguration = Realm.Configuration.defaultConfiguration
    
    // Propiedades para el directorio de Realm
    private static let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    private static let documentsDirectory = paths[0]
    private static let docURL = URL(string: documentsDirectory)!
    private static let dataPath = docURL.appendingPathComponent("Realms")
    
    private static func checkDirectory() {
        
        if FileManager.default.fileExists(atPath: self.dataPath.absoluteString) == false{
            do {
                try FileManager.default.createDirectory(atPath: self.dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // Create "test.realm"
    static func testDataConfiguration() -> Realm.Configuration {
        self.checkDirectory()
        
        var config = Realm.Configuration()
        config.fileURL = self.dataPath.appendingPathComponent("test.realm")
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            if (oldSchemaVersion < config.schemaVersion){
            }
        }
        return config
    }
    
    // Create "estacionamiento.realm"
    public static func estacionamientoDataConfiguration() -> Realm.Configuration {
        self.checkDirectory()
        
        var config = Realm.Configuration()
        config.fileURL = self.dataPath.appendingPathComponent("estacionamiento.realm")
        return config
    }
    
    static func deleteDatabase(configuration: Realm.Configuration) {
        let realmURL = configuration.fileURL!
        let realmURLs = [
            realmURL,
            realmURL.appendingPathExtension("lock"),
            realmURL.appendingPathExtension("note"),
            realmURL.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            do {
                try FileManager.default.removeItem(at: URL)
            } catch (let errorMessage){
                // handle error
                print(errorMessage)
            }
        }
    }
}
