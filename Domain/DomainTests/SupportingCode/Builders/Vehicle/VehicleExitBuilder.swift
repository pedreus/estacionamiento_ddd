//
//  VehicleExitBuilder.swift
//  DomainTests
//
//  Created by Pedro Erazo Acosta on 31/12/20.
//

import Foundation
@testable import Domain

public class VehicleExitBuilder {
    
    var exitDate: Date = Date()
    var expendedTime: (Int, Int) = (0, 0)
    var entry: Entry? = nil
    
    func with(exitDate: Date) -> VehicleExitBuilder {
        self.exitDate = exitDate
        return self
    }
    
    func with(expendedTime: (Int, Int)) -> VehicleExitBuilder {
        self.expendedTime = expendedTime
        return self
    }
    
    func with(entry: Entry) -> VehicleExitBuilder {
        self.entry = entry
        return self
    }
    
    func build() throws -> Exit {
        let unwrappedEntry: Entry?
        if let entry = entry {
            unwrappedEntry = entry
        } else {
            unwrappedEntry = try VehicleEntryBuilder().build()
        }
        return Exit(exitDateTime: exitDate, entry: unwrappedEntry!)
    }
}
