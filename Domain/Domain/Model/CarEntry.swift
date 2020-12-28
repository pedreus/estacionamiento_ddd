//
//  CarEntry.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class CarEntry: Entry {
    
    // Atributos del ingreso propios de un carro
    
    init(entryDateTime: Date, car: Car) throws {
        try super.init(entryDateTime: entryDateTime, vehicle: car)
    }
}
