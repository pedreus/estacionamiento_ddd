//
//  AlertGenerator.swift
//  Domain
//
//  Created by Pedro Erazo Acosta on 30/12/20.
//

import UIKit

public class AlertGenerator {

    public class func createSimpleInformationAlert(title: String, message: String) -> UIAlertController {
        let alertAcceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAcceptAction)
        
        return alert
    }
}
