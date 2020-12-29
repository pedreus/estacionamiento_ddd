//
//  RealmRepository.swift
//  DataAccess
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//
import RealmSwift

public class RealmRepository {
    
    internal var realmConfiguration: Realm.Configuration
    
    init(realmConfiguration: Realm.Configuration = RealmConfiguration.estacionamientoDataConfiguration()) {
        self.realmConfiguration = realmConfiguration
    }
}
