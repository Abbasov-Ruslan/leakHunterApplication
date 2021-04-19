//
//  ViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 12.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchPasswordTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    var apiPasswordManger = APIPasswordManager()
    var apiNewsManager = ApiNewsManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 10
        searchButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        searchPasswordTextField.layer.cornerRadius = 10.0
//        searchPasswordTextField.layer.borderWidth = 2.0
        searchPasswordTextField.layer.borderColor = UIColor.black.cgColor
        searchPasswordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        let password = searchPasswordTextField.text ?? ""
        var response = ""
        apiNewsManager.getNewsJson()
        
        apiPasswordManger.passwordRequest(password: password){ [weak self] (string) in
            response = string
            print(response)
            DispatchQueue.main.async {
                if response == "" {
                    let alert = UIAlertController(title: "Good", message: "It's ok your pasword is not pawned", preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Your passward was pawned", message: response + "times", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
        
    }
    
    
}

