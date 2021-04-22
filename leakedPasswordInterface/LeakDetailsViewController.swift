//
//  Leak.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 22.04.2021.
//

import Foundation
import UIKit

class LeakDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var leakDetails:NewsModel = NewsModel(name: "", title: "", domain: "", breachDate: "", pwnCount: 0, description: "", dataClasses: [], isVerified: false, isFabricated: false, isSensitive: false, isRetired: false, isSpamList: false, addedDate: "", logoPath: "", modifiedDate: "", image: UIImage(systemName: "key"), sortDate: Date())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = leakDetails.name
    }
    
    
}
