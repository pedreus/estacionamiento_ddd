//
//  CarEntryService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 28/12/20.
//

public class CarEntryService {
    
    var carEntryRepository: CarEntryRepository
    
    init(carEntryRepository: CarEntryRepository) {
        self.carEntryRepository = carEntryRepository
    }
    
    func isValidCarQuantity(maxQuantity: Int) throws -> Bool {
        return try self.carEntryRepository.isValidCarsQuantity(maxQuantity: maxQuantity)
    }
    
    func saveCarEntry(carEntry: CarEntry) throws {
        if (try !self.isValidCarQuantity(maxQuantity: 20)) {
            throw BusinessError.CarQuantityComplete()
        }
        try self.carEntryRepository.saveCarEntry(carEntry: carEntry)
    }
}
