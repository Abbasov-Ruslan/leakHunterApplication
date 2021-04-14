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
        var response = apiPasswordManger.passwordRequest(password: password)
        print(response)
    }


}

