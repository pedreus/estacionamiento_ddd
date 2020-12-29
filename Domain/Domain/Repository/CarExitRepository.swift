//
//  CarExitRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public protocol CarExitRepository {
    
    func saveCarExit(carExit: CarExit) throws
    
}
