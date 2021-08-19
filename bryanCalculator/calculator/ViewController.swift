//
//  ViewController.swift
//  calculator
//
//  Created by Bryan Lee on 8/16/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    var stringNum: String = ""
    var firstNum: Double = 0.0
    var secondNum: Double = 0.0
    var opStr: String = ""
    var hasOperation = false
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if hasOperation == false {
            firstNum = Double(stringNum) ?? 0.0
//            print("first num is : \(firstNum)")
            hasOperation = true
            stringNum = ""
        } else {
            secondNum = Double(stringNum) ?? 0.0
//            print("first num is : \(secondNum)")
            stringNum = ""
        }
        
        if let operate = sender.titleLabel?.text {
            if operate == "=" {
                hasOperation = false
                if opStr == "+" {
                    displayNum.text = String(Int(firstNum + secondNum))
                } else if opStr == "-" {
                    displayNum.text = String(Int(firstNum - secondNum))
                } else if opStr == "x" {
                    displayNum.text = String(Int(firstNum * secondNum))
                } else if opStr == "/" {
                    displayNum.text = String(Int(firstNum / secondNum))
                }
            } else {
                opStr = operate
            }
        }
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text, let num = Int(title) else {
            return
        }
        if hasOperation == false {
            stringNum.append(title)
//            print("setting first num")
            displayNum.text = String(stringNum)
        } else if hasOperation == true {
            stringNum.append(title)
//            print("setting second num")
            displayNum.text = String(stringNum)
        }
    }
}

