//
//  ViewController.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 12.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchPasswordTextField: UITextField!
    
    var apiPasswordManger = APIPasswordManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        
        
        let password = searchPasswordTextField.text ?? ""
        
        var response = ""
        apiPasswordManger.passwordRequest(password: password){ [weak self] (string) in
            response = string
            print(response)
            DispatchQueue.main.async {
                
                // create the alert
                let alert = UIAlertController(title: "My Title", message: response, preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    
}

