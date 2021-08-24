//
//  ViewController.swift
//  tableView
//
//  Created by Luat on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {


    var dataArray: [[String]] = []
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    let musicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    var decodable: [[Displayable]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
/// Automatically set tableView's delegate to be ViewController
//        tableView.dataSource = self
        
        fetchData()
    }
    
    func fetchData() {
        fetchJokesData()
    }
    
    func fetchJokesData() {
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        var jokesArr: [Joke] = []
        let group = DispatchGroup()
        for _ in 0..<3 {
            group.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer { group.leave() }
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(Joke.self, from: data)
                    jokesArr.append(decoded)
                } catch {
                    print(error)
                }
            }.resume()
        }
        group.notify(queue: .main) {
            self.decodable.append(jokesArr)
            self.fetchShowsData()
        }
    }
    
    func fetchShowsData() {
        let url = URL(string: "https://api.tvmaze.com/shows/431/episodes")!
        var showsArr: [Show] = []
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode([Show].self, from: data)
                showsArr = decoded
                print(showsArr)
                self.decodable.append(Array(showsArr[0...9]))
                self.fetchDrinksData()
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchDrinksData() {
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin")!
        var drinksArr: [Drink.DrinkItem] = []
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode(Drink.self, from: data)
                drinksArr.append(contentsOf: decoded.drinks)
                self.decodable.append(Array(drinksArr[0...9]))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return decodable.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodable[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Shows"
        case 1:
            return "Music"
        case 2:
            return "Drinks"
        default:
            return "No Title"
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        view.backgroundColor = .systemTeal
        
        let label = UILabel(frame: view.bounds)
        label.textAlignment = .center
        view.addSubview(label)
        
        switch section {
        case 0:
            label.text = "Joke"
        case 1:
            label.text = "Show"
        case 2:
            label.text = "Drinks"
        default:
            label.text = "No Title"
        }
        
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else {
            fatalError()
        }
        
        let decodedItem = decodable[indexPath.section][indexPath.row]
        
        var labelStr = ""
        labelStr = decodedItem.displayStr ?? ""
        
//        if let decodedItem = decodedItem as? Joke {
//            labelStr = decodedItem.value ?? ""
//        } else if let decodedItem = decodedItem as? Show {
//            labelStr = decodedItem.name ?? ""
//        } else if let decodedItem = decodedItem as? Drink.DrinkItem {
//            labelStr = decodedItem.strDrink ?? ""
//        }
        
        cell.episodeName.text = labelStr
        cell.idLabel.text = "S: \(indexPath.section), R: \(indexPath.row)"
        
        return cell
    }
}


protocol Displayable {
    var displayStr: String? { get }
}

struct Joke: Decodable, Displayable {
    let value: String?
    var displayStr: String? { return value }
}

struct Show: Decodable, Displayable {
    let name: String?
    var displayStr: String? { return name }
}

struct Drink: Decodable {
    let drinks: [DrinkItem]
    struct DrinkItem: Decodable, Displayable {
        let strDrink: String?
        var displayStr: String? { return strDrink }
    }
}
