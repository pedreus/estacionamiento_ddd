//
//  MotorcycleBill.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class MotorcycleBill: Bill {
    
    // Atributos factura motos
    
    override init(billDateTime: Date, exit: Exit) {
        super.init(billDateTime: billDateTime, exit: exit)
        self.setCost(cost: self.calculateCostForDaysAndHoursForMotorcycles())
    }
    
    private func calculateCostForDaysAndHoursForMotorcycles() -> Int {
        let (days, hours) = self.getExit().getExpendedTimeInDaysAndHours()
        let daylyCost = days * MotorcycleServiceCost.day.rawValue
        let hourlyCost = hours * MotorcycleServiceCost.hour.rawValue
        var totalCost = daylyCost + hourlyCost
        
        totalCost += self.add500CylinderAditionalCost()
        return Int(totalCost)
    }
    
    private func add500CylinderAditionalCost() -> Int {
        if(self.getExit().getEntry().getVehicle().getCylinder() > 500) {
            return 2000
        }
        return 0
    }
}

private enum MotorcycleServiceCost: Int {
    case day = 4000
    case hour = 500
}
