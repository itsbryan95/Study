//
//  ViewController.swift
//  calculator
//
//  Created by Luat on 8/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text, let num = Int(title) else {
            return
        }
        if hasOperation == false {
            firstNum = num
            print("setting first num")
        } else if hasOperation == true {
            secondNum = num
            print("setting second num")
        }
        displayLabel.text = title
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        hasOperation = true
        guard let op = sender.titleLabel?.text else {
            return
        }
        if op == "+" {
            opStr = op
            displayLabel.text = op
        } else if op == "=" {
            performOperation()
        }
        
        print("pressed operation")
    }
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var opStr: String = ""
    var hasOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func performOperation() {
        hasOperation = false
        switch opStr {
        case "+":
            let result = firstNum + secondNum
            displayLabel.text = String(result)
        default:
            print("Operation not valid")
        }
    }

}

