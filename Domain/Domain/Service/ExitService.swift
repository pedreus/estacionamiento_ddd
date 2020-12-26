//
//  ExitService.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 23/12/20.
//

import UIKit

public class ExitService: NSObject {

    var exitRepository: ExitRepository
    
    public init(exitRepository: ExitRepository) {
        self.exitRepository = exitRepository
    }
    
    func calculateExpendedTimeInHours(startTime: Date, endTime: Date) -> Int {
        return 0
    }
}
