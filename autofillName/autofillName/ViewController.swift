//
//  ViewController.swift
//  autofillName
//
//  Created by Bryan Lee on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    var nameKey = "name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        attemptToSetName()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setName(name: textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}


extension ViewController {
    
    func setName(name: String ) {
        UserDefaults.standard.setValue(name, forKey: "name")
    }
    
    func getName(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    func fetchName(key: String) -> Any? {
        guard let name = try? getName(key: key) else {
            return nil
        }
        return name
    }
    
    func attemptToSetName() {
        if let name = fetchName(key: "name") {
            if let name = name as? String  {
                nameField.text = name
            }
        }
    }
}
