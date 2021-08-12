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
    @IBAction func jokesPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Joke button"
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Drinks button"
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        firstLabel.text = "Testing TVShows button"

    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }

    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
}

