import UIKit

extension String {
    func getIntValue() -> Int {
        if let intValue = Int(self) {
            return intValue
        } else {
            return -1
        }
    }
}

"asdf".getIntValue()
let myInt: Int = "10".getIntValue()

/// Class, Struct, Enums, Protocols
class A {
    func a() {
        print("a from class")
    }
}

class B: A {
    
}

extension A {
    func b() {
        print("b from extension")
    }
}

let a = A()
a.a()
a.b()

struct Person {
    var fname: String = "No fname yet"
    var lname: String = "no lname yet"
    var email: String = "place@gmail.com"
}

extension Person: Hashable {

}

/// Extensions are not for storage
extension Person {
    var fullName: String {
        get {
            return "Mr." + fname + " " + lname + " !"
        }
    }
    
    /// Computed property
    /// Getter to get some other stored property
    /// Setter to do logic checks and update stored property
    
    var emailIntermediate: String {
        get {
            return email
        }
        set {
            print(newValue)
            if newValue.contains("@") {
                email = newValue
///                this will crash
//                emailIntermediate = newValue
            } else {
                print("newValue not valid")
            }
        }
    }
    
    func tellTime() {
        print(Date())
        self.fname
    }
    func getFullName() -> String {
        return fname + " " + lname
    }
}

let person = Person(fname: "Anakin", lname: "Skywalker")
person.tellTime()
print(person.getFullName())
print(person.fullName)


var personMedals: [Person: Int] = [:]
let mikePhelps = Person(fname: "Mike", lname: "p")
var me = Person(fname: "luke", lname: "p")
personMedals[mikePhelps] = 18
personMedals[me] = 0
print(personMedals)

me.email
me.emailIntermediate
me.emailIntermediate = "luke@gmail.com"
print(me.emailIntermediate)



struct Address {
    private var _location: String = "no location"
}

extension Address {
    var location: String {
        get {
            _location
        }
        set {
            _location = newValue
        }
    }
}

let address = Address()
//address._location
address.location
