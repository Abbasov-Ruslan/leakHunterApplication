//
//  GenerateViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 27.04.2021.
//

import UIKit

class GenerateViewController: UIViewController {
    @IBOutlet weak var generateButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateButton.titleLabel?.minimumScaleFactor = 0.5
        generateButton.titleLabel?.numberOfLines = 1
        generateButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
