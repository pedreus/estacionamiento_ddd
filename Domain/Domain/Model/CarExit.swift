//
//  CarExit.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//
import Foundation

public class CarExit: Exit {
    
    // Atributos de la salida del carro
    
    init(exitDateTime: Date, carEntry: CarEntry) {
        super.init(exitDateTime: exitDateTime, entry: carEntry)
    }
}
