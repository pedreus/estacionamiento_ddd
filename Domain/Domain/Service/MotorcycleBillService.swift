//
//  MotorcycleBillService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

public class MotorcycleBillService {
    
    var motoBillRepository: MotorcycleBillRepository
    
    public init(motoBillRepository: MotorcycleBillRepository) {
        self.motoBillRepository = motoBillRepository
    }
    
    public func saveMotorcycleBill(motoBill: MotorcycleBill) throws {
        try self.motoBillRepository.saveMotorcycleBill(motoBill: motoBill)
    }
}
