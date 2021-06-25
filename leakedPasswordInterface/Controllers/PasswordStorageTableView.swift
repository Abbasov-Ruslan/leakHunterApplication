//
//  PasswordStorageTableView.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 12.05.2021.
//

import Foundation
import UIKit
import CoreData

class PasswordStorageTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var accounts: [NSManagedObject] = []
    var locIndexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Passwords storage"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Account")
        
        do {
            accounts = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()
    }
    

    
    func save(password: String, login: String, site: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
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
            accounts.append(account)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    
}

// MARK: - UITableViewDataSource
extension PasswordStorageTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let account = accounts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = account.value(forKeyPath: "site") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        locIndexPath = indexPath.row
        performSegue(withIdentifier: "cellData", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !accounts.isEmpty {
        let cellVC = segue.destination as! PasswordCellDataViewController
        let account = accounts[locIndexPath]
        cellVC.loadedPassword = account.value(forKey: "password") as! String
        cellVC.loadedLogin = account.value(forKey: "login") as! String
        cellVC.loadedSite = account.value(forKey: "site") as! String
        }
    }
    
}
