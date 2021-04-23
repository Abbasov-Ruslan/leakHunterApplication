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
    @IBOutlet weak var breachCountLabel: UILabel!
    @IBOutlet weak var breachDateLabel: UILabel!
    @IBOutlet weak var addedDateLabel: UILabel!
    @IBOutlet weak var modifiedLabel: UILabel!
    
    
    @IBOutlet weak var verifiedCheckbox: UIImageView!
    @IBOutlet weak var fabrickatedCheckbox: UIImageView!
    @IBOutlet weak var sensetiveCheckbox: UIImageView!
    @IBOutlet weak var retiredCheckbox: UIImageView!
    @IBOutlet weak var spamCheckbox: UIImageView!
    
    var leakDetails:NewsModel = NewsModel(name: "", title: "", domain: "", breachDate: "", pwnCount: 0, description: "", dataClasses: [], isVerified: false, isFabricated: false, isSensitive: false, isRetired: false, isSpamList: false, addedDate: "", logoPath: "", modifiedDate: "", image: UIImage(systemName: "key"), sortDate: Date())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = leakDetails.name
        breachCountLabel.text = String(leakDetails.pwnCount)
        breachDateLabel.text = leakDetails.breachDate
        addedDateLabel.text = leakDetails.addedDate
        modifiedLabel.text = leakDetails.modifiedDate
        
        if leakDetails.isVerified {
            verifiedCheckbox.image = UIImage(systemName: "checkmark")
        }
        if leakDetails.isFabricated {
            fabrickatedCheckbox.image = UIImage(systemName: "checkmark")
        }
        if leakDetails.isSensitive {
            sensetiveCheckbox.image = UIImage(systemName: "checkmark")
        }
        if leakDetails.isRetired {
            retiredCheckbox.image = UIImage(systemName: "checkmark")
        }
        if leakDetails.isSpamList {
            spamCheckbox.image = UIImage(systemName: "checkmark")
        }
    }
    
    
}
