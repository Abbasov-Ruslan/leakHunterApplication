//
//  NewsTableViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 16.04.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    private var cellPointSize: CGFloat!
    private static let LeakCell = "LeakCell"
    var apiNewsManager = apiManager()
    var newsArray:[NewsModel] = []
    var secondArray:[NewsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        apiNewsManager.getNews(){NewsModel in
            self.newsArray = NewsModel
            var i = 0
            
            self.secondArray = self.sortArray(arr: self.newsArray)
            
            for item in self.secondArray{
                let url = URL(string: item.logoPath)
                if let data = try? Data(contentsOf: url!) {
                    self.secondArray[i].image = UIImage(data: data)
                }
                i+=1
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            }
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func sortArray(arr:[NewsModel]) -> [NewsModel] {
        var k = 0
        var arr2:[NewsModel] = []
        for _ in arr {
            arr2 = arr.sorted {
                $0.addedDate > $1.addedDate
            }
            k+=1
        }
        return arr2
    }
    
    // MARK: - Table view data source
    
    func resizedImage(image: UIImage, for size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
//        return section == 0 ? newsArray.count : 1
        return section == 0 ? newsArray.count : 1
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "All Font Families" : "My Favorite Fonts"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The font names list
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewController.LeakCell, for: indexPath)
        
        cell.textLabel?.text = secondArray[indexPath.row].name
        cell.detailTextLabel?.text = secondArray[indexPath.row].domain
        
        let image = secondArray[indexPath.row].image
        let image2 = resizedImage(image: image ?? #imageLiteral(resourceName: "list"), for: CGSize(width: 60, height:30))
        cell.imageView?.image = image2
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let leakVC = segue.destination as! LeakDetailsViewController
        
        leakVC.leakDetails = secondArray[indexPath.row]
    }
    
}

