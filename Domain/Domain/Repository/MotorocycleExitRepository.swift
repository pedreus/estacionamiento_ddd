//
//  MotorocycleExitRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public protocol MotorcycleExitRepository {
    
    func saveMotorcycleExit(motoExit: MotorcycleExit) throws
}
