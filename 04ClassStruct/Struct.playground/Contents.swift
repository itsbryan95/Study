import UIKit


/// Class, Struct, Enum, Protocol

//struct Location {
//    let lat: Int
//}
//protocol LocationProtocol {
//    var lat: Int { get set }
//}

struct City {
    var lat: Int = 0
    let name: String
    private(set) var motto: String
    
/// automattic generated member-wise initializer
    init(name: String, motto: String) {
        self.name = name
        self.motto = motto
    }
    
    mutating func changeMotto(to motto: String) {
        self.motto = motto
    }
    
//    deinit {
//    }
}

var philly = City(name: "Philly", motto: "Always Sunny")
print("City name:", philly.name, philly.motto)

/// Makes a new copy on write
let phillyTwo = philly

//philly.motto = "Always Rainy in the fall"
philly.changeMotto(to: "Always Rainy in the fall")

print(philly.motto)
print(phillyTwo.motto)


func changeParams(city: inout City) {
    city.changeMotto(to: "Changed Motto")
}

changeParams(city: &philly)
print(philly.motto)
