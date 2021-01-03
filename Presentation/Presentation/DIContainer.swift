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
        
        /*
         Inyección de dependencias para Entries
         */
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
        
        /*
         Inyección de dependencias para Exits
         */
        
        self.container.register(CarExitRepository.self, factory: {
            _ in
            CarExitRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(CarExitService.self, factory: {
            repository in
            CarExitService(carExitRepository: repository.resolve(CarExitRepository.self)!)
        })
        
        self.container.register(MotorcycleExitRepository.self, factory: {
            _ in
            MotorcycleExitRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(MotorcycleExitService.self, factory: {
            repository in
            MotorcycleExitService(motoExitRepository: repository.resolve(MotorcycleExitRepository.self)!)
        })
        
        /*
         Inyección de dependencias para Bills
         */
        
        self.container.register(CarBillRepository.self, factory: {
            _ in
            CarBillRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(CarBillService.self, factory: {
            repository in
            CarBillService(carBillRepository: repository.resolve(CarBillRepository.self)!)
        })
        
        self.container.register(MotorcycleBillRepository.self, factory: {
            _ in
            MotorcycleBillRealmRepository(realmConfiguration: productionConfiguration)
        })
        self.container.register(MotorcycleBillService.self, factory: {
            repository in
            MotorcycleBillService(motoBillRepository: repository.resolve(MotorcycleBillRepository.self)!)
        })
    }
    
    func getContainer() -> Container {
        return container
    }
}
