//
//  DIContainer.swift
//  Presentation
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 25/11/20.
//

import Swinject
import Domain
import DataAccess

public class DIContainer {
    
    private let container: Container = Container()
    
    func registerDependencies() throws {
        let realmConfiguration = ProductionRealmConfiguration()
        let productionConfiguration = try realmConfiguration.gestProductionDataConfiguration()
        
        self.container.register(CarEntryRepository.self, factory: {
            _ in
            CarEntryRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(CarEntryService.self, factory: {
            repository in
            CarEntryService(carEntryRepository: repository.resolve(CarEntryRepository.self)!)
        })
        
        self.container.register(MotorcycleEntryRepository.self, factory: {
            _ in
            MotorcycleEntryRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(MotorcycleEntryService.self, factory: {
            repository in
            MotorcycleEntryService(motorcycleEntryRepository: repository.resolve(MotorcycleEntryRepository.self)!)
        })
    }
    
    func getContainer() -> Container {
        return container
    }
}

/*
 container.register(PersonRepository.self) {
     _ in PersonRepositoryRemote()
 }
 
 container.register(PersonService.self) {
     repository in PersonService(personRepository: repository.resolve(PersonRepository.self)!)
 }
 */
