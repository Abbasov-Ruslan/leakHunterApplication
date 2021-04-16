//
//  NewsTableViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 16.04.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    private var familyNames: [String] = ["one", "two" ,"three", "four"]
    private var cellPointSize: CGFloat!
    private static let LeakCell = "LeakCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyNames.append("one")
        familyNames.append("two")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The font names list
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewController.LeakCell, for: indexPath)
        cell.textLabel?.text = familyNames[indexPath.row]
        cell.detailTextLabel?.text = familyNames[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "paperplane.fill")
        return cell
    }
}

