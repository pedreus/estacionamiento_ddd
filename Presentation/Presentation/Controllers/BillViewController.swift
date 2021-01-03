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
    @IBOutlet weak var lblServiceCosts: UILabel!
    @IBOutlet weak var lblExpendedTime: UILabel!
    
    var carExitService: CarExitService?
    var motoExitService: MotorcycleExitService?
    var carBillService: CarBillService?
    var motoBillService: MotorcycleBillService?
    
    var entry: Entry!
    private var exit: Exit?
    private var bill: Bill?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.carExitService = appDelegate.diContainer.getContainer().resolve(CarExitService.self)!
        self.motoExitService = appDelegate.diContainer.getContainer().resolve(MotorcycleExitService.self)!
        self.carBillService = appDelegate.diContainer.getContainer().resolve(CarBillService.self)!
        self.motoBillService = appDelegate.diContainer.getContainer().resolve(MotorcycleBillService.self)!
        
        self.generateBill()
    }
    
    private func createCarExit() {
        self.exit = CarExit(exitDateTime: Date(), carEntry: self.entry as! CarEntry)
    }
    
    private func createMotorcycleExit() {
        self.exit = MotorcycleExit(exitDateTime: Date(), motoEntry: self.entry as! MotorcycleEntry)
    }
    
    private func createCarBill() {
        self.bill = CarBill(billDateTime: Date(), carExit: self.exit as! CarExit)
    }
    
    private func createMotorcycleBill() {
        self.bill = MotorcycleBill(billDateTime: Date(), motoExit: self.exit as! MotorcycleExit)
    }
    
    private func saveCarExit() throws {
        try self.carExitService?.saveCarExitRepository(carExit: self.exit as! CarExit)
    }
    
    private func saveCarBill() throws {
        try self.carBillService?.saveCarBill(carBill: self.bill as! CarBill)
    }
    
    private func saveMotorcycleExit() throws {
        try self.motoExitService?.saveMotorcycleExit(motoExit: self.exit as! MotorcycleExit)
    }
    
    private func saveMotorcycleBill() throws {
        try self.motoBillService?.saveMotorcycleBill(motoBill: self.bill as! MotorcycleBill)
    }
    
    private func printBillInformation() {
        self.lblLicense.text = self.entry.getVehicle().getVehicleLicense()
        self.lblCylinder.text = self.entry.getVehicle().getCylinder().description
        self.lblEntryDate.text = self.getFormatterEntryDate(date: self.entry.getEntryDateTime())
        self.lblExitDate.text = self.getFormatterEntryDate(date: self.exit!.getExitDateTime())
        self.lblExpendedTime.text = "\(self.exit?.getExpendedTimeInDaysAndHours().0 ?? 0) días y \(self.exit?.getExpendedTimeInDaysAndHours().1 ?? 0) horas"
        self.lblServiceCosts.text = "$ \(self.bill?.getCost() ?? 0)"
    }

    private func generateBill() {
        switch type(of: self.entry!) {
        case is CarEntry.Type:
            self.createCarExit()
            self.createCarBill()
            do {
                try self.saveCarExit()
                try self.saveCarBill()
            } catch let error {
                print("Save Car: ", error)
            }
        case is MotorcycleEntry.Type:
            self.createMotorcycleExit()
            self.createMotorcycleBill()
            do {
                try self.saveMotorcycleExit()
                try self.saveMotorcycleBill()
            } catch let error {
                print("Save Moto: ", error)
            }
        default:
            self.exit = nil
            self.bill = nil
        }
        
        if let _ = self.exit, let _ = self.bill {
            self.printBillInformation()
        }
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
