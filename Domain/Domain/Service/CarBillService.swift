//
//  CarBillService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

public class CarBillService {
    
    var carBillRepository: CarBillRepository
    
    init(carBillRepository: CarBillRepository) {
        self.carBillRepository = carBillRepository
    }
    
    func saveCarBill(carBill: CarBill) throws {
        try self.carBillRepository.saveCarBill(carBill: carBill)
    }
}
