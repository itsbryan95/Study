//
//  ViewController.swift
//  TableViewAPI
//
//  Created by Bryan Lee on 8/18/21.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var dataArray : [[Decodable]] = [[],[],[],[]]
    let group = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        group.enter()
        DispatchQueue.global().async{
            self.fetchJokesData()
            self.group.enter()
            self.fetchJokesData()
            self.group.enter()
            self.fetchDrinksData()
            self.group.enter()
            self.fetchTVData()
            self.group.enter()
            self.fetchMusicData()
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.tableView.reloadData()
        }
    }
    
    struct JokesData: Codable {
        let value: String
        let created_at: String
        let id: String
    }
    
    func fetchJokesData() {
        let jokesStr = "https://api.chucknorris.io/jokes/random"
        if let url = URL(string: jokesStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let dataDecoded = try decoder.decode(JokesData.self, from: data)
                        self.dataArray[0] = self.dataArray[0] + [dataDecoded]
                        self.group.leave()
                        } catch {
                            print("error decoding:", error)
                        }
                }
            })
            task.resume()
        }
    }
    
    struct DrinksData: Codable {
        var drinks: [OneDrinkData]
    }

    struct OneDrinkData: Codable {
        var strDrink: String
        var idDrink: String
    }
    
    func fetchDrinksData() {
        let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
        if let url = URL(string: drinksStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in

                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let dataDecoded = try decoder.decode(DrinksData.self, from: data)
                        self.dataArray[1] = self.dataArray[1] + dataDecoded.drinks
                        self.group.leave()
                    } catch {
                        print("error decoding:", error)
                    }
                }
            })
            task.resume()
        }
    }

    
    struct Show: Codable {
        let name: String
        let season: Int
        let number: Int
    }
    
    func fetchTVData() {
        let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"

        if let url = URL(string: tvShowsStr) {
            URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    if let show = try? decoder.decode([Show].self, from: data) {
                        self.dataArray[2] = self.dataArray[2] + show
                        print(show.first!.season)
                        self.group.leave()
                    }
                }
            })
            .resume()
        }
    }
    
    
    struct Info: Codable {
        let feed: Feed
    }

    struct Feed: Codable {
        let results: [Song]
    }

    struct Song: Codable {
        let artistName: String
    }
    
    
    func fetchMusicData() {
        let musicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
        if let url = URL(string: musicStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let FeedDecoded = try? decoder.decode(Info.self, from: data)
                        if let FeedDecoded  = FeedDecoded {
                            self.dataArray[3] = self.dataArray[3] + FeedDecoded.feed.results
                            self.group.leave()
                        }
                    }
                }
            })
            task.resume()
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
            return dataArray.count
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataArray[section].count
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        view.backgroundColor = .systemPink
        let label = UILabel(frame: view.bounds)
        switch section {
        case 0: label.text =  "Jokes"
        case 1: label.text =  "Drinks"
        case 2: label.text =  "TV"
        case 3: label.text =  "Music"
        default: label.text =  "no title"
        }
        view.addSubview(label)
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
                    fatalError()
                }
        if indexPath.section == 0 {
            cell.propertyName.text = (self.dataArray[indexPath.section][indexPath.row] as? JokesData)?.value
            
            cell.propertyTwo.text = (self.dataArray[indexPath.section][indexPath.row] as? JokesData)?.id
        } else if indexPath.section == 1 {
            cell.propertyName.text = (self.dataArray[indexPath.section][indexPath.row] as? OneDrinkData)?.strDrink
            
            cell.propertyTwo.text = (self.dataArray[indexPath.section][indexPath.row] as? OneDrinkData)?.idDrink
        } else if indexPath.section == 2 {
            cell.propertyName.text = (self.dataArray[indexPath.section][indexPath.row] as? Show)?.name
            
            cell.propertyTwo.text = String((self.dataArray[indexPath.section][indexPath.row] as? Show)?.season ?? 0)
            
        } else if indexPath.section == 3 {
            cell.propertyName.text = (self.dataArray[indexPath.section][indexPath.row] as? Song)?.artistName
        }
        return cell
    }
}

