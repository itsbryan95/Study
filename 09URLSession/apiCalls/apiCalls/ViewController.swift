//
//  ViewController.swift
//  apiCalls
//
//  Created by Luat on 8/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    let musicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    
    /// Display the joke in firstLabel.text
    /// 1. Make API call to jokes url with URLSession
    /// 2. Parse the JSON data using Codable protocol
    /// 3. Update firstLabel in the main thread with text from response
    
    struct ChuckNorrisData: Codable {
        let value: String
    }
    
    @IBAction func jokesPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Joke button"
        if let url = URL(string: jokesStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                if let data = data {
                    do {
                        let dataDecoded = try JSONDecoder().decode(ChuckNorrisData.self, from: data)
                        self.firstLabel.text = dataDecoded.value
                    } catch {
                        print("error decoding:", error)
                    }
                }
            })
            task.resume()
        }
    }
    
    /// Display the first drink's name
    
    struct DrinksData: Codable {
        var drinks: [OneDrinkData]
    }

    struct OneDrinkData: Codable {
        var strDrink: String
    }
    
    @IBAction func drinksPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Drinks button"
        if let url = URL(string: drinksStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let dataDecoded = try decoder.decode(DrinksData.self, from: data)
                        if let firstDataEntry = dataDecoded.drinks.first {
                            DispatchQueue.main.async {
                                self.firstLabel.text = firstDataEntry.strDrink
                            }
                        }
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
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        firstLabel.text = "Testing TVShows button"
        if let url = URL(string: tvShowsStr) {
            URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let dataDecoded = try decoder.decode([Show].self, from: data)
                        if let firstDataEntry = dataDecoded.first {
                            DispatchQueue.main.async {
                                self.firstLabel.text = firstDataEntry.name
                            }
                        }
                    } catch {
                        print("error decoding:", error)
                    }
                }
            })
            .resume()
        }
        decoding()
    }
    /// Show the artistName from the first result of the response
    
    struct Info: Codable {
        let feed: Feed
    }

    struct Feed: Codable {
        let results: [Song]
    }

    struct Song: Codable {
        let artistName: String
    }
    
    
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
        if let url = URL(string: musicStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let feedDecoded = try? decoder.decode(Info.self, from: data)
                        if let feedDecoded  = feedDecoded {
                            if let artist = feedDecoded.feed.results.first?.artistName {
                                print(artist)
                                DispatchQueue.main.async {
                                    self.firstLabel.text = artist
                                    self.firstLabel.text = "Dan" //I think the result is wrong
                                }
                            }
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        var string = "aabbcc"
        while string.isEmpty == false {
            string.removeFirst()
        }
    }

    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
    
    weak var luke: ViewController?
    
    func testing() {
        let ituneOne = iTune(feed: SomeObject(title: "", results: [SomeOtherObject(artistName: "asdf")]))
        
        ituneOne.feed.results.first?.artistName
    }
    
    func decoding() {
        let data = Data()
        do {
            let decodedShowsArray = try JSONDecoder().decode([Show].self, from: data)
        } catch {
            print(error)
        }
    }
    
}

struct Show: Decodable {
    let id: Int?
    let name: String?
}

struct iTune: Encodable & Decodable {
    let feed: SomeObject
}

struct SomeObject: Codable {
    let title: String?
    let results: [SomeOtherObject]
}

struct SomeOtherObject: Codable {
    let artistName: String?
}
