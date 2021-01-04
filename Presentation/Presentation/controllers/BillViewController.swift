//
//  BillViewController.swift
//  Presentation
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//

import UIKit
import Domain

class BillViewController: UIViewController {
    
    @IBOutlet weak var lblLicense: UILabel!
    @IBOutlet weak var lblCylinder: UILabel!
    @IBOutlet weak var lblEntryDate: UILabel!
    @IBOutlet weak var lblExitDate: UILabel!
    @IBOutlet weak var lblExpendedTime: UILabel!
    @IBOutlet weak var lblServiceCosts: UILabel!
    
    var entry: Entry!
    private var exit: Exit?
    private var bill: Bill?
    
    private var carExitService: CarExitService?
    private var carBillService: CarBillService?
    private var motoExitService: MotorcycleExitService?
    private var motoBillService: MotorcycleBillService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.carExitService = appDelegate.diContainer.getContainer().resolve(CarExitService.self)!
        self.carBillService = appDelegate.diContainer.getContainer().resolve(CarBillService.self)!
        self.motoExitService = appDelegate.diContainer.getContainer().resolve(MotorcycleExitService.self)!
        self.motoBillService = appDelegate.diContainer.getContainer().resolve(MotorcycleBillService.self)!
        
        do {
            try self.generateBill()
        } catch let error {
            let alert = AlertGenerator.createSimpleInformationAlert(title: "Factura", message: error.localizedDescription)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func saveCarExit() throws {
        self.exit = CarExit(exitDateTime: Date(), carEntry: self.entry as! CarEntry)
        
        try self.carExitService?.saveCarExitRepository(carExit: self.exit as! CarExit)
    }
    
    private func saveCarBill() throws {
        self.bill = CarBill(billDateTime: Date(), carExit: self.exit as! CarExit)
        
        try self.carBillService?.saveCarBill(carBill: self.bill as! CarBill)
    }
    
    private func saveMotorcycleExit() throws {
        self.exit = MotorcycleExit(exitDateTime: Date(), motoEntry: self.entry as! MotorcycleEntry)
        
        try self.motoExitService?.saveMotorcycleExit(motoExit: self.exit as! MotorcycleExit)
    }
    
    private func saveMotorcycleBill() throws {
        self.bill = MotorcycleBill(billDateTime: Date(), motoExit: self.exit as! MotorcycleExit)
        
        try self.motoBillService?.saveMotorcycleBill(motoBill: self.bill as! MotorcycleBill)
    }
    
    private func showBillInformation() {
        let (days, hours) = self.exit!.getExpendedTimeInDaysAndHours()
        
        self.lblLicense.text = self.entry.getVehicle().getVehicleLicense()
        self.lblCylinder.text = self.entry.getVehicle().getCylinder().description
        self.lblEntryDate.text = self.getFormatterEntryDate(date: self.entry.getEntryDateTime())
        self.lblExitDate.text = self.getFormatterEntryDate(date: self.exit!.getExitDateTime())
        self.lblExpendedTime.text = "\(days) días - \(hours) horas"
        self.lblServiceCosts.text = "$ \(self.bill!.getCost().description)"
    }
    
    private func generateBill() throws {
        switch type(of: self.entry!) {
        case is CarEntry.Type:
            try self.saveCarExit()
            try self.saveCarBill()
        case is MotorcycleEntry.Type:
            try self.saveMotorcycleExit()
            try self.saveMotorcycleBill()
        default:
            throw BusinessError.WrongVehicleType()
        }
        
        self.showBillInformation()
    }
    
    private func getFormatterEntryDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - h:m"
        
        return dateFormatter.string(from: date)
    }
    
    @IBAction func actionBtnAccept(_ sender: UIButton) {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
