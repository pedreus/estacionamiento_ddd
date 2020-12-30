//
//  CarExitService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Foundation

public class CarExitService {
    
    var carExitRepository: CarExitRepository
    
    public init(carExitRepository: CarExitRepository) {
        self.carExitRepository = carExitRepository
    }
    
    public func saveCarExitRepository(carExit: CarExit) throws {
        try self.carExitRepository.saveCarExit(carExit: carExit)
    }
}
