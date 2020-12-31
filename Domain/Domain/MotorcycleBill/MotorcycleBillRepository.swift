//
//  MotorcycleBillRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

public protocol MotorcycleBillRepository {
    
    func saveMotorcycleBill(motoBill: MotorcycleBill) throws
}
