//
//  MotorcycleEntry.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class MotorcycleEntry: Entry {
    
    // Atributos propios para el ingreso de una motocicleta
    
    init(entryDateTime: Date, motorcycle: Motorcycle) throws {
        try super.init(entryDateTime: entryDateTime, vehicle: motorcycle)
    }
}
