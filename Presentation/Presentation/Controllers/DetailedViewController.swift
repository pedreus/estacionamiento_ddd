//
//  DetailViewController.swift
//  Presentation
//
//  Created by Pedro Erazo Acosta on 2/01/21.
//

import UIKit
import Domain

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var lblLicense: UILabel!
    @IBOutlet weak var lblCylinder: UILabel!
    @IBOutlet weak var lblEntryDate: UILabel!
    @IBOutlet weak var lblExitDate: UILabel!
    @IBOutlet weak var lblServiceDays: UILabel!
    @IBOutlet weak var lblServiceHours: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var entry: Entry!
    var exit: Exit?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblLicense.text = self.entry.getVehicle().getVehicleLicense()
        self.lblCylinder.text = self.entry.getVehicle().getCylinder().description
        self.lblEntryDate.text = self.getFormatterEntryDate(date: self.entry.getEntryDateTime())
        
        self .setNavigationBarTitle()
        
        self.exit = Exit(exitDateTime: Date(), entry: self.entry)
        
        if let exit = self.exit {
            let (days, hours) = exit.getExpendedTimeInDaysAndHours()
            
            self.lblExitDate.text = self.getFormatterEntryDate(date: exit.getExitDateTime())
            self.lblServiceDays.text = days.description
            self.lblServiceHours.text = hours.description
        }
        
    }
    
    private func setNavigationBarTitle() {
        let navbarTitle: String
            
        switch type(of: self.entry!) {
        case is MotorcycleEntry.Type:
            navbarTitle = "Servicio de motocicleta"
        case is CarEntry.Type:
            navbarTitle = "Servicio de automóvil"
        default:
            navbarTitle = ""
        }
        
        self.navigationBar.topItem?.title = navbarTitle
    }
    
    private func getFormatterEntryDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - h:m"
        
        return dateFormatter.string(from: date)
    }
    
    @IBAction func actionBtnBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func actionBtnBill(_ sender: UIButton) {
        let vc = BillViewController()
        vc.entry = self.entry
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
