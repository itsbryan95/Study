//
//  SecondViewController.swift
//  passingData
//
//  Created by Luat on 8/19/21.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print("loading view at Second VC")
        print(dataArray)
    }
    

}
