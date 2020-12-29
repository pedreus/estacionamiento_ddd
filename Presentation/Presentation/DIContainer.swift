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
    
    func registerDependencies() {
        
        self.container.register(CarEntryRepository.self, factory: {
            _ in
            CarEntryRealmRepository()
        })
        /*self.container.register(CarEntryService.self, factory: {
            repository in
            CarEntryService(carEntryRepository: repository.resolve(CarEntryRepository.self))
        })*/
        
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
