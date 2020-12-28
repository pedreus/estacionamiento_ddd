//
//  MotorcycleExit.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class MotorcycleExit: Exit {
    
    // Atributos de salida de moto
    
    init(exitDateTime: Date, motoEntry: MotorcycleEntry) {
        super.init(exitDateTime: exitDateTime, entry: motoEntry)
    }
}
