import UIKit

let address = "https://hn.algolia.com/api/v1/items/1"

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

func mappingToStruct(data: Data?) {
    let decoder = JSONDecoder()
    if let data = data {
        do {
            let hackerNewDecoded = try decoder.decode(HackerNews.self, from: data)
            print(hackerNewDecoded.authorName)
            DispatchQueue.main.async {
                label.text = hackerNewDecoded.authorName
            }
        } catch {
            print("error decoding:", error)
        }
    }
}
if let url = URL(string: address) {
    print("creating task")
    let task = URLSession.shared.dataTask(with: url, completionHandler:{ (data, response, error) in
        
        guard let data = data, error == nil else {
            print("Data is empty, network error: \(error)")
            return
        }

        guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {
            print("Error: status code is not 200")
            return
        }
        
        mappingToStruct(data: data)
    })
    task.resume()
}
struct HackerNews: Codable {
    
    enum CodingKeys: String, CodingKey {
        case authorName = "author"
        case id = "id"
        case title = "title"
    }
    
    let id: Int
    let authorName: String
    let title: String
}
