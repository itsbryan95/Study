//
//  ViewController.swift
//  tableView
//
//  Created by Luat on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {


    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
/// Automatically set tableView's delegate to be ViewController
//        tableView.dataSource = self
        
        fetchData()
    }
    
    func fetchData() {
//        URLSession.
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.dataArray = [
                "first element",
                "second name",
                "third title",
                "first element",
                "second name",
                "third title",
            ]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else {
            fatalError()
        }
        
        cell.episodeName.text = "testing"
        cell.idLabel.text = "Row: \(indexPath.row)"
        
        return cell
    }
}

