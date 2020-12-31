//
//  ServicesViewController.swift
//  Presentation
//
//  Created by Pedro Erazo Acosta on 27/12/20.
//

import UIKit
import Domain
import DataAccess

class ServicesViewController: UIViewController {
    
    @IBOutlet weak var tableActiveServices: UITableView!
    
    private var carEntryService: CarEntryService?
    private var motorcycleEntryService: MotorcycleEntryService?
    
    private var entriesList = [Entry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.carEntryService = appDelegate.diContainer.getContainer().resolve(CarEntryService.self)!
        self.motorcycleEntryService = appDelegate.diContainer.getContainer().resolve(MotorcycleEntryService.self)!
        
        self.tableActiveServices.delegate = self
        self.tableActiveServices.dataSource = self
        
        self.getAllCarEntries()
    }
    
    private func getFormatterEntryDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - h:m"
        
        return dateFormatter.string(from: date)
    }
    
    private func getAllCarEntries() {
        var alertMessage = ""
        do {
            let carEntries = try self.carEntryService?.getAllCarEntries()
            if (carEntries!.count > 0) {
                self.entriesList.insert(contentsOf: carEntries!, at: 0)
                self.tableActiveServices.reloadData()
            }
        } catch BusinessError.EmptyVehicleLicense (let message) {
            alertMessage = message
        } catch BusinessError.EmptyVehicleCylinder (let message) {
            alertMessage = message
        } catch BusinessError.IncorrectVehicleLicense (let message) {
            alertMessage = message
        } catch BusinessError.IncorrectVehicleCylinder (let message) {
            alertMessage = message
        } catch BusinessError.WrongAlphanumericTextEntry (let message) {
            alertMessage = message
        } catch BusinessError.VehicleLicenseUnauthorized (let message) {
            alertMessage = message
        } catch BusinessError.IncorrectWeekDay (let message) {
            alertMessage = message
        } catch BusinessError.CarQuantityComplete (let message) {
            alertMessage = message
        } catch BusinessError.MotorcycleQuantityComplete (let message) {
            alertMessage = message
        } catch let error as NSError {
            alertMessage = "Error ingresos \(error.localizedDescription)"
        }
        
        print(alertMessage)
    }
    
    
    @IBAction func actionBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        if (self.entriesList.count > 0) {
            let vehicleEntry = self.entriesList[indexPath.row]
            cell.textLabel?.text = "Placa: \(vehicleEntry.getVehicle().getVehicleLicense()) (\(vehicleEntry.getVehicle().getCylinder().description) cc)"
            cell.detailTextLabel?.text = self.getFormatterEntryDate(date: vehicleEntry.getEntryDateTime())
        }
        return cell
    }
    
}
