import UIKit

/// Distinct cases
enum Career {
    case Business
    case Healthcare
    case Tech
}

let career = Career.Business
switch career {
case .Business:
    print()
case .Healthcare:
    print()
case .Tech:
    print()
}
print(career)

/// Enum Raw Value
enum Planet: Int {
    case Mercury = 9
    case Venus   = 10
    case Earth   = 11
    case Mars    = 12
}

let earth: Planet = .Earth
print(earth.rawValue)
let inputInt = 12
let planet = Planet(rawValue: inputInt)

/// Associated Value
enum Location {
    var time: Int {
        switch self {
        case .LA:
            return 800
        case .Dallas(let value):
            return 1000 + (Int(value) ?? 0)
        case .NYC:
            return 1100
        }
    }
    case LA
    case Dallas(String)
    case NYC
}

let city = Location.LA
print(city.time)
let cityTwo = Location.Dallas("Dallas, TX")
print(cityTwo.time)

switch cityTwo {
case .Dallas(let value):
    print("associated value in SWITCH:", value)
default:
    print("couldn't access value")
}

if case Location.Dallas(let value) = cityTwo {
    print("associated value in IF:", value)
}

/// Can have functions and  computed properties, but not stored properties
enum Team {
//    var myList: [Int] = []
    func doSomething() {}
    static func doClassMethod() {}
}

protocol Some {
    
}

enum USSport: Some {
    struct Basketball {}
    struct Football {}
}

enum EuropeSport {
    struct Basketball {}
    struct Football {}
}

//let sportZero = USSport()

let sportOne = USSport.Basketball()
let sportTwo = USSport.Football()

let sportThree = EuropeSport.Football()
