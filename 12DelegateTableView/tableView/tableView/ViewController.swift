//
//  ViewController.swift
//  tableView
//
//  Created by Luat on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {

    var dataArray: [[Decodable]] = []
    
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
            self.dataArray = [[
                "first element",
                "second name",
                "third title",
                "first element",
                "second name",
                "third title",
            ],[
            "first element",
            "second name",
            "third title",
            "first element",
            "second name",
            "third title",
            ],[
            "first element",
            "second name",
            "third title",
            "first element",
            "second name",
            "third title",
            ]]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "Shows"
//        case 1: return "Music"
//        case 2: return "Joke"
//        default: return "no title"
//        }
//    }
//
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        view.backgroundColor = .systemPink
        let label = UILabel(frame: view.bounds)
        switch section {
        case 0: label.text =  "Shows"
        case 1: label.text =  "Music"
        case 2: label.text =  "Joke"
        default: label.text =  "no title"
        }
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else {
            fatalError()
        }
        
        cell.episodeName.text = "testing"
        cell.idLabel.text = "S: \(indexPath.section) R: \(indexPath.row)"
        
        return cell
    }
}

