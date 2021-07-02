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
    let largeConfig = UIImage.SymbolConfiguration(scale: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        generateButton.titleLabel?.minimumScaleFactor = 0.5
        generateButton.titleLabel?.numberOfLines = 1
        generateButton.titleLabel?.adjustsFontSizeToFitWidth = true

        generateButton.layer.cornerRadius = 10
        generateButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]

    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func sliderValuerChanged(_ sender: Any) {
        lengthOfPasswordNumber.text = String(Int(lengthOfPasswordSlider.value))
    }
    @IBAction func generateNewPasswordPressed(_ sender: Any) {
        let length = Int(lengthOfPasswordNumber.text ?? "0")
        generator.generatePassword(length: length!,
                                   num: isNums,
                                   symbols: isSymbols,
                                   upper: isCapitalised) { (generatedPassword) in
            DispatchQueue.main.async {
                self.passwordTextField.text = generatedPassword
            }
        }
    }
    @IBAction func symbolsCheckboxPressed(_ sender: Any) {
        changeCheckboxImage(flag: isSymbols, checkbox: symbolsCheckbox)
        isSymbols = isSymbols ? false : true
    }
    @IBAction func capitalisedCheckBoxPressed(_ sender: Any) {
        changeCheckboxImage(flag: isCapitalised, checkbox: capitilisedCheckBox)
        isCapitalised = isCapitalised ? false : true
    }
    @IBAction func numsCheckboxPressed(_ sender: Any) {
        changeCheckboxImage(flag: isNums, checkbox: numsCheckBox)
        isNums = isNums ? false : true
    }
}

extension GenerateViewController {
    func changeCheckboxImage(flag: Bool, checkbox: UIButton) {
        switch flag {
        case true:
            checkbox.setImage(UIImage(systemName: "square", withConfiguration: largeConfig), for: .normal)
        case false:
            checkbox.setImage(UIImage(systemName: "checkmark.square", withConfiguration: largeConfig), for: .normal)
        }
    }
}
