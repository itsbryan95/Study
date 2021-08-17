import UIKit


/// Delegation Pattern
protocol PageDataDelegate {
    func getPage(pageNum: Int) -> String
}

struct BookComic: PageDataDelegate {
    var pages = ["page 1", "page 2", "page 3", "page 4", "page 5", "page 6"]
    func getPage(pageNum: Int) -> String {
        return pages[pageNum]
    }
    mutating func destroyBook() {
        pages = []
    }
}

class Reader {
    var bookDelegate: PageDataDelegate?
    func printPage(at pageNum: Int) {
        if let bookDelegate = bookDelegate {
            let result = bookDelegate.getPage(pageNum: pageNum)
            print(result)
        }
    }
}

var reader = Reader()
let book = BookComic()
reader.bookDelegate = book
reader.printPage(at: 2)
