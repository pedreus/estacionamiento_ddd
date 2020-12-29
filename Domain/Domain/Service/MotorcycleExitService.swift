//
//  MotorcycleExitService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

import Foundation

public class MotorcycleExitService {
    
    var motoExitRepository: MotorcycleExitRepository
    
    init(motoExitRepository: MotorcycleExitRepository) {
        self.motoExitRepository = motoExitRepository
    }
    
    func saveMotorcycleExit(motoExit: MotorcycleExit) throws {
        try self.motoExitRepository.saveMotorcycleExit(motoExit: motoExit)
    }
}
