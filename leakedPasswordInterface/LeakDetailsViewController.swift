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
    
    @IBOutlet weak var dataClassesLabel: UILabel!
    @IBOutlet weak var leakDescriptionTextView: UITextView!
    
    
    var leakDetails:NewsModel = NewsModel(name: "", title: "", domain: "", breachDate: "", pwnCount: 0, description: "", dataClasses: [], isVerified: false, isFabricated: false, isSensitive: false, isRetired: false, isSpamList: false, addedDate: "", logoPath: "", modifiedDate: "", image: UIImage(systemName: "key"), sortDate: Date())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = leakDetails.name
        breachCountLabel.text = String(leakDetails.pwnCount)
        breachDateLabel.text = leakDetails.breachDate
        addedDateLabel.text = leakDetails.addedDate
        modifiedLabel.text = leakDetails.modifiedDate
            
        dataClassesLabel.text = ""
        for item in leakDetails.dataClasses {
            dataClassesLabel.text = dataClassesLabel.text! + item + "\n"
        }
        
        let str = leakDetails.description.htmlToAttributedString
        
        leakDescriptionTextView.attributedText = str
        
        leakDescriptionTextView.font = UIFont(name: leakDescriptionTextView.font!.fontName, size: 17)
        leakDescriptionTextView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
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


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
