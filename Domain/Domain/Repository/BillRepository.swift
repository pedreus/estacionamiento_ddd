//
//  BillRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import Foundation

public protocol BillRepository {
    
    func saveBill(bill: Bill)
}
