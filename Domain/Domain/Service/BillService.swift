//
//  BillService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//

public class BillService {
    
    private var billRepository: BillRepository
    
    init(billRepository: BillRepository) {
        self.billRepository = billRepository
    }
    
    func saveBill(bill: Bill) {
        self.billRepository.saveBill(bill: bill)
    }
}
