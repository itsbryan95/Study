//
//  ViewController.swift
//  passingData
//
//  Created by Luat on 8/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataFromThird: UILabel!
    @IBAction func thirdButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let thirdVC = sb.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdViewController else {
            return
        }
//        thirdVC.name = "Passing From First"
        thirdVC.getData(string: "Passing using func")
        thirdVC.closure = { str in
            print("Code from first VC", str)
            self.dataFromThird.text = str
        }
        
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing segue")
        let secondVC = segue.destination as? SecondViewController
        secondVC?.dataArray = [
            "here",
            "is",
            "the",
            "data",
            dataFromThird.text ?? ""
        ]
    }
}

