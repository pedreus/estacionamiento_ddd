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
    

    //private var carEntryService: CarEntryService?
    //private var motorcycleService: MotorcycleEntryService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func actionCtrlVehicleType(_ sender: UISegmentedControl) {
    }
    
    @IBAction func actionBtnRegister(_ sender: UIButton) {
    }
    
    @IBAction func actionBtnActiveServices(_ sender: UIButton) {
    }
    
}

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}


/*
 let appDelegate = UIApplication.shared.delegate as! AppDelegate
 personService = appDelegate.diContainer.getContainer().resolve(PersonService.self)!
 
 var roles: Array<Role> = Array<Role>()
 let role: Role = Role(name: "Role01")
 role.setDescription(description: "RoleDescription01")
 roles.append(role)
 
 do {
     let authUser: AuthUser = try AuthUser(userId: "User01", password: "123", roles: roles)
     let person = try Person(id: "Person01", name: "Summy Person", authUser: authUser)
     try personService!.savePerson(person: person)
     print("Se ha guardado correctamente")
 } catch BusinessError.EmptyRoles(let errorMessage) {
     print(errorMessage)
 } catch BusinessError.WrongPassword(let errorMessage) {
     print(errorMessage)
 } catch BusinessError.PersonAlreadyExists(let errorMessage) {
     print(errorMessage)
 } catch {
     print("Sucedió un error")
 }
 */
