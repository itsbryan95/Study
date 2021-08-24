//
//  DrinkFavoritesViewController.swift
//  drinksCache
//
//  Created by Luat on 8/24/21.
//

import UIKit

class DrinkFavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var drinks: [DrinkItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: DrinkCell.identifier, bundle: nil), forCellReuseIdentifier: DrinkCell.identifier)
    }
    
}

extension DrinkFavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier) as? DrinkCell else {
            fatalError()
        }
        cell.drinkName.text = drinks[indexPath.row].name
        return cell
        
    }
}
