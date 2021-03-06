//
//  MotorcycleEntryService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public class MotorcycleEntryService {
    
    var motorcycleEntryRepository: MotorcycleEntryRepository
    
    public init(motorcycleEntryRepository: MotorcycleEntryRepository) {
        self.motorcycleEntryRepository = motorcycleEntryRepository
    }
    
    public func isValidMotorcyclesQuantity(maxQuantity: Int) throws -> Bool {
        return try self.motorcycleEntryRepository.isValidMotorcyclesQuantity(maxQuantity: maxQuantity)
    }
    
    public func saveMotorcycleEntry(motoEntry: MotorcycleEntry) throws {
        if (try !self.isValidMotorcyclesQuantity(maxQuantity: 10)) {
            throw BusinessError.MotorcycleQuantityComplete()
        }
        try self.motorcycleEntryRepository.saveMotorcycleEntry(motoEntry: motoEntry)
    }
    
    public func getAllMotorcycleEntries() throws -> [MotorcycleEntry] {
        try self.motorcycleEntryRepository.getAllMotorcycleEntries()
    }
}
