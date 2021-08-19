//
//  ViewController.swift
//  movieList
//
//  Created by Bryan Lee on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {
    
    struct Show: Codable {
        let name: String
        let season: Int
        let number: Int
    }
    
    var dataArray : [Show] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData() {
        let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"

        if let url = URL(string: tvShowsStr) {
            URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                let decoder = JSONDecoder()
                if let data = data {
                    
                    if let show = try? decoder.decode([Show].self, from: data) {
                        self.dataArray = show
                        DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
                    }
                }
            })
            .resume()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell else {
                    fatalError()
                }
        
        cell.episodeName.text = dataArray[indexPath.row].name
        cell.episodeNum.text = String(dataArray[indexPath.row].number)
        cell.seasonNum.text = String(dataArray[indexPath.row].season)
        
        return cell

    }
    
    

}

