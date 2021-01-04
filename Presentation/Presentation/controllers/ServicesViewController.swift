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
        
        self.getAllVehicleEntries()
    }
    
    private func getFormatterEntryDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - h:m"
        
        return dateFormatter.string(from: date)
    }
    
    private func getCarEntries() throws -> [CarEntry]? {
        return try self.carEntryService?.getAllCarEntries()
    }
    
    private func getMotorcycleEntries() throws -> [MotorcycleEntry]? {
        return try self.motorcycleEntryService?.getAllMotorcycleEntries()
    }
    
    private func orderEntriesByDateAsc(){
        if (self.entriesList.count > 0) {
            self.entriesList.sort(by: {$0.getEntryDateTime() < $1.getEntryDateTime()})
        }
    }
    
    private func getAllVehicleEntries() {
        var alertMessage = ""
        do {
            if let carEntries = try self.getCarEntries() {
                self.entriesList.insert(contentsOf: carEntries, at: 0)
            }
            if let motoEntries = try self.getMotorcycleEntries() {
                self.entriesList.insert(contentsOf: motoEntries, at: 0)
            }
            //let motoEntries = try self.motorcycleEntryService.ge
            if (self.entriesList.count > 0) {
                self.orderEntriesByDateAsc()
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
    
    private func showExit(entry: Entry) {
        let vc = DetailedViewController()
        vc.entry = entry
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
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
            cell.textLabel?.text = "\(NSLocalizedString("placa", comment: "")): \(vehicleEntry.getVehicle().getVehicleLicense()) (\(vehicleEntry.getVehicle().getCylinder().description) cc)"
            cell.detailTextLabel?.text = self.getFormatterEntryDate(date: vehicleEntry.getEntryDateTime())
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = self.entriesList[indexPath.row]
        
        self.showExit(entry: entry)
    }
}
