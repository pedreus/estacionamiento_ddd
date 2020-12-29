//
//  CarBillRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 29/12/20.
//

public protocol CarBillRepository {
    
    func saveCarBill(carBill: CarBill) throws
}
