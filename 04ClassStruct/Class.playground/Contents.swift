import UIKit

//let char: Character = "a"
//let code = char.unicodeScalars
//let codeValue = code.first!.value
//let newChar = Character(UnicodeScalar(codeValue + 1)!)

class Cat {
    //    static let species = "Feline"
    func meow() {
        print("meow")
    }
}

class Person: Cat {
    private(set)var name: String
    fileprivate var age: Int
    
    static let species = "Homo sapiens"
    static func expandToMars() {
        print("mars")
    }
    
    /// partial initializer, we have to call a full initializer
    /// (convenience init)
    convenience init(name: String) {
        let titleName = "Mr. " + name
        self.init(name: titleName, age: 10)
    }
    
    /// full initializers (designated init)
    override init() {
        /// name doesn't have value yet
        name = "no name"
        age = 0
        /// setting name value has to be done
    }
    
    init(age: Int) {
        self.age = age
        self.name = "no name"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func takeAWalk(distance: Int) {
        for num in 0...distance {
            print("\(name) is walking \(num)")
        }
    }
    
    func takeAWalk(distance: Double) {
        for num in 0...Int(distance) {
            print("\(name) is walking \(num)")
        }
    }
    
    func changeName(newName: String) {
        self.name = newName
    }
    
}

let noName = Person()
noName.changeName(newName: "Bobby")

print(noName.name)
let tom = Person(name: "Tom")
print(tom.name)
//tom.name = "Timmy"
print(tom.name)
tom.takeAWalk(distance: 3)
tom.takeAWalk(distance: 4.5)
tom.age = 10

//tom.location
print(Person.species)

//if type(of: tom) is Person.Type {
//    print("tom is person")
//}

Person.expandToMars()
//tom.expandToMars()
type(of: tom).expandToMars()


class Employee: Person {
    var job: String
    
    init(job: String, name: String) {
        self.job = job
        //        super.init()
        super.init(name: name, age: 10)
    }
    
    override func takeAWalk(distance: Int) {
        print("plumbers can't take a walk")
    }
    
    func fixSink() {
        print("fixing")
        restAfterWork()
    }
    
    private func restAfterWork() {
        print("resting")
    }
    
    deinit {
        print("removing form memory")
    }
}

let timPlumber = Employee(job: "Plumbing", name: "Timothy")
print(timPlumber.name)
timPlumber.takeAWalk(distance: 10)
timPlumber.fixSink()
//plumber.restAfterWork()
//tom.fixSink()

let ericPlumber = Employee(job: "Plumbing", name: "Eric")
print(ericPlumber.name)

let plumberPlacerholder = ericPlumber
plumberPlacerholder.changeName(newName: "Harry")
print("new name:", plumberPlacerholder.name)
print("old name:", ericPlumber.name)

func changePlumberAge(plumber: Employee) {
    plumber.age = 100
}
changePlumberAge(plumber: ericPlumber)
print(ericPlumber.age)
changePlumberAge(plumber: plumberPlacerholder)
print(ericPlumber.age)

func doSomething() {
    let bobEmployee = Employee(job: "Driver", name: "Bob")
    print("finishing doSomething function")
}

doSomething()

class SemiHuman: Person {
    
}
let semiHuman = SemiHuman()
semiHuman.meow()
semiHuman.takeAWalk(distance: 2)
