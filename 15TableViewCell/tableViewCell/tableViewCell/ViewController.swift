//
//  ViewController.swift
//  tableViewCell
//
//  Created by Luat on 8/20/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let musicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json"
    
    var musicData: [MusicItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "MyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyCell")
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else { fatalError() }
        
        let model = musicData[indexPath.row]
        cell.nameLabel.text = model.artistName
        if let imageURL = URL(string: model.artworkUrl100 ?? "") {
            URLSession.shared.dataTask(with: imageURL) { d, r, e in
                guard let data = d else { return }
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    cell.myImageView.image = image
                }
            }.resume()
            
        }
        return cell
    }
    

    func fetchData() {
        guard let url = URL(string: musicStr) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode(iTune.self, from: data)
                print(decoded)
                self.musicData = decoded.feed.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                
            }
            
        }.resume()
    }
}


struct iTune: Encodable & Decodable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String?
    let results: [MusicItem]
}

struct MusicItem: Codable {
    let artistName: String?
    let artworkUrl100: String?
}

