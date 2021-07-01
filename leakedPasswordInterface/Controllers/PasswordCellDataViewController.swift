//
//  PasswordCellDataViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 13.05.2021.
//

import Foundation
import UIKit
import CoreData

class PasswordCellDataViewController: UIViewController {
    
    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loadedPassword = ""
    var loadedLogin = ""
    var loadedSite = ""
    
    var accountsArray:[NSManagedObject] = []
    var  numberOfCell: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        siteTextField.text = loadedSite
        loginTextField.text = loadedLogin
        passwordTextField.text = loadedPassword
    }
    
    
    @IBAction func saveButtonTouched(_ sender: Any) {
        let locPassword = passwordTextField.text ?? ""
        let locLogin = loginTextField.text ?? ""
        let locSite = siteTextField.text ?? ""
        
        self.save(password: locPassword, login: locLogin, site: locSite)
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func save(password: String, login: String, site: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        if password == "" {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Account", in: managedContext)!
        let account = NSManagedObject(entity: entity, insertInto: managedContext)
        account.setValue(password, forKeyPath: "password")
        account.setValue(login, forKeyPath: "login")
        account.setValue(site, forKeyPath: "site")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Account", in: managedContext)!
        let account = NSManagedObject(entity: entity, insertInto: managedContext)
            let elementToRemove = accountsArray[numberOfCell]
            managedContext.delete(elementToRemove)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC = segue.destination as! PasswordStorageTableViewController
        tableVC.deleteRow()
    }
}
