//
//  RealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//
import RealmSwift

public class RealmRepository {
    
    var realmConfiguration: Realm.Configuration
    
    public init(realmConfiguration: Realm.Configuration = RealmConfiguration.estacionamientoDataConfiguration()) {
        self.realmConfiguration = realmConfiguration
    }
}
