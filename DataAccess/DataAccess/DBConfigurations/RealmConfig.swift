//
//  RealmConfig.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 30/12/20.
//
import Foundation
import RealmSwift

public class RealmConfig {
    
    var defaultDataConfiguration = Realm.Configuration.defaultConfiguration
    
    // Propiedades para el directorio de Realm
    private let paths: [String]
    private let documentsDirectory: String
    private let docURL: URL
    let dataPath: URL
    
    public init () {
        self.paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        self.documentsDirectory = paths[0]
        self.docURL = URL(string: documentsDirectory)!
        self.dataPath = docURL.appendingPathComponent("Realms")
    }
    
    func checkDirectory() throws {
        if FileManager.default.fileExists(atPath: self.dataPath.absoluteString) == false{
            try FileManager.default.createDirectory(atPath: self.dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
