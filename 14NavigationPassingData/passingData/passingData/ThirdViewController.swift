//
//  ThirdViewController.swift
//  passingData
//
//  Created by Luat on 8/19/21.
//

import UIKit

class ThirdViewController: UIViewController {

    var name: String = ""
    var closure: (String) -> Void = {_ in}
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("button pressed")
        let inputStr = textField.text ?? ""
        
        closure(inputStr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("loading view at Third VC")
        print("name: \(name)")
        nameLabel.text = name
    }
    

    func getData(string: String) {
//        nameLabel.text = string
        self.name = string
    }
}
