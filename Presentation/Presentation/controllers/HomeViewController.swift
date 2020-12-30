//
//  ViewController.swift
//  Presentation
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 28/10/20.
//

import UIKit
import Domain
import DataAccess

class HomeViewController: UIViewController {
    
    @IBOutlet weak var txtVehicleLicense: UITextField!
    @IBOutlet weak var txtVehicleCylinder: UITextField!
    @IBOutlet weak var ctrlVehicleType: UISegmentedControl!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnActiveServices: UIButton!
    
    
    private var carEntryService: CarEntryService?
    private var motorcycleEntryService: MotorcycleEntryService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ctrlVehicleType.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.carEntryService = appDelegate.diContainer.getContainer().resolve(CarEntryService.self)!
        self.motorcycleEntryService = appDelegate.diContainer.getContainer().resolve(MotorcycleEntryService.self)!
        
    }
    
    private func eraseTextFieldData() {
        self.txtVehicleCylinder.text = ""
        self.txtVehicleLicense.text = ""
        self.txtVehicleLicense.becomeFirstResponder()
    }
    
    private func createBaseVehicle() throws -> Vehicle {
        let cylinder = self.txtVehicleCylinder.text
        let license = self.txtVehicleLicense.text
        let vehicle = try Vehicle(cylinder: Int(cylinder?.description ?? "") ?? -1, vehicleLicense: license ?? "")
        return vehicle
    }
    
    private func saveCarEntry(vehicle: Vehicle) throws {
        let carEntry = try CarEntry(
            entryDateTime: Date(),
            car: Car(
                cylinder: vehicle.getCylinder(),
                vehicleLicense: vehicle.getVehicleLicense()
            )
        )
        try carEntryService?.saveCarEntry(carEntry: carEntry)
    }
    
    private func saveMotorcycleEntry(vehicle: Vehicle) throws {
        let motoEntry = try MotorcycleEntry(
            entryDateTime: Date(),
            motorcycle: Motorcycle(cylinder: vehicle.getCylinder(),
                                   vehicleLicense: vehicle.getVehicleLicense()
            )
        )
        try motorcycleEntryService?.saveMotorcycleEntry(motoEntry: motoEntry)
    }
    
    @IBAction func actionCtrlVehicleType(_ sender: UISegmentedControl) {
    }
    
    @IBAction func actionBtnRegister(_ sender: UIButton) {
        var alertTitle = ""
        var alertMessage = ""
        
        do {
            let vehicle = try self.createBaseVehicle()
            
            switch self.ctrlVehicleType.selectedSegmentIndex {
            case 0:
                try self.saveCarEntry(vehicle: vehicle)
                alertTitle = "Ingreso del carro exitoso"
                alertMessage = "Se ha registrado el ingreso del carro exitosamente."
                self.eraseTextFieldData()
            case 1:
                try self.saveMotorcycleEntry(vehicle: vehicle)
                alertTitle = "Ingreso de la moto exitoso"
                alertMessage = "Se ha registrado el ingreso de la motocicleta exitosamente."
                self.eraseTextFieldData()
            default:
                alertTitle = "Ingreso fallido"
                alertMessage = "No se ha podido registrar el ingreso del vehículo."
            }
        } catch BusinessError.EmptyVehicleLicense (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.EmptyVehicleCylinder (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.IncorrectVehicleLicense (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.IncorrectVehicleCylinder (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.WrongAlphanumericTextEntry (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.VehicleLicenseUnauthorized (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.IncorrectWeekDay (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.CarQuantityComplete (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch BusinessError.MotorcycleQuantityComplete (let message) {
            alertTitle = "Ingreso fallido"
            alertMessage = message
        } catch {
            alertTitle = "Ingreso fallido"
            alertMessage = "No fue posible registrar el ingreso del vehículo."
        }
        
        let alert = AlertGenerator.createSimpleInformationAlert(title: alertTitle, message: alertMessage)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionBtnActiveServices(_ sender: UIButton) {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
