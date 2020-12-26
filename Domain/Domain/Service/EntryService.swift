//
//  EntryService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import UIKit

public class EntryService: NSObject {

    var entryRepository: EntryRepository
    
    public init(entryRepositorio: EntryRepository) {
        self.entryRepository = entryRepositorio
    }
    
    func saveEntry(entry: Entry) {
        self.entryRepository.saveEntry(entry: entry)
    }
}
