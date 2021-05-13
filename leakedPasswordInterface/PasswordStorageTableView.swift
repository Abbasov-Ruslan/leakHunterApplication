//
//  PasswordStorageTableView.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 12.05.2021.
//

import Foundation
import UIKit
import CoreData

class PasswordStorageTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cells: [NSManagedObject] = []
    
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
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")

      do {
        cells = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
}

// MARK: - UITableViewDataSource
extension PasswordStorageTableViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cells.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let person = cells[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = person.value(forKeyPath: "name") as? String
    return cell
  }
}
