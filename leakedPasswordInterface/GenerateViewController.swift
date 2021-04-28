//
//  GenerateViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 27.04.2021.
//

import UIKit

class GenerateViewController: UIViewController {
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var lengthOfPasswordNumber: UILabel!
    @IBOutlet weak var lengthOfPasswordSlider: UISlider!
    @IBOutlet weak var symbolsCheckbox: UIButton!
    @IBOutlet weak var capitilisedCheckBox: UIButton!
    @IBOutlet weak var numsCheckBox: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let generator = APIPassGenManager()
    var isSymbols = false
    var isCapitalised = false
    var isNums = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateButton.titleLabel?.minimumScaleFactor = 0.5
        generateButton.titleLabel?.numberOfLines = 1
        generateButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func sliderValuerChanged(_ sender: Any) {
        lengthOfPasswordNumber.text = String(Int(lengthOfPasswordSlider.value))
    }
    
    @IBAction func generateNewPasswordPressed(_ sender: Any) {
        var length = Int(lengthOfPasswordNumber.text ?? "0")
        generator.generatePassword(length: length!, num: isNums, symbols: isSymbols, upper: isCapitalised) { (String) in
            DispatchQueue.main.async {
            self.passwordTextField.text = String
            }
        }
    }
    
    
    
    
    
    let largeConfig = UIImage.SymbolConfiguration(scale: .large)
    
    @IBAction func symbolsCheckboxPressed(_ sender: Any) {
        switch isSymbols {
        case true:
            isSymbols = false
            symbolsCheckbox.setImage(UIImage(systemName: "square", withConfiguration: largeConfig), for: .normal)
        case false:
            isSymbols = true
            symbolsCheckbox.setImage(UIImage(systemName: "checkmark.square",  withConfiguration: largeConfig), for: .normal)
        }

    }
    @IBAction func capitalisedCheckBoxPressed(_ sender: Any) {
        switch isCapitalised {
        case true:
            isCapitalised = false
            capitilisedCheckBox.setImage(UIImage(systemName: "square", withConfiguration: largeConfig), for: .normal)
        case false:
            isCapitalised = true
            capitilisedCheckBox.setImage(UIImage(systemName: "checkmark.square",  withConfiguration: largeConfig), for: .normal)
        }
    }
    @IBAction func numsCheckboxPressed(_ sender: Any) {
        switch isNums {
        case true:
            isNums = false
            numsCheckBox.setImage(UIImage(systemName: "square",  withConfiguration: largeConfig), for: .normal)
        case false:
            isNums = true
            numsCheckBox.setImage(UIImage(systemName: "checkmark.square",  withConfiguration: largeConfig), for: .normal)
        }
    }
    
    
}
