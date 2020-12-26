//
//  EntryRepository.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import Foundation

public protocol EntryRepository {
    
    func getWeekDayFromDateForEntry(date: Date)
    
    func saveEntry(entry: Entry)
}
