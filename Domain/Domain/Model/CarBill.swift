//
//  CarBill.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class CarBill: Bill {
    
    // Atributos factura carro
    
    public init(billDateTime: Date, carExit: CarExit) {
        super.init(billDateTime: billDateTime, exit: carExit)
        self.setCost(cost: self.calculateCostForDaysAndHoursForCars())
    }
    
    private func calculateCostForDaysAndHoursForCars() -> Int {
        let (days, hours) = self.getExit().getExpendedTimeInDaysAndHours()
        let daylyCost = days * CarServiceCost.day.rawValue
        let hourlyCost = hours * CarServiceCost.hour.rawValue
        let totalCost = daylyCost + hourlyCost
        
        return Int(totalCost)
    }
    
}

private enum CarServiceCost: Int {
    case day = 8000
    case hour = 1000
}
