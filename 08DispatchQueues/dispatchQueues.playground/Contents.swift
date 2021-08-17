import UIKit

/// UI - related updates
/// Serial queue
DispatchQueue.main.async {
    // takes 1 sec
//    print("main queue")
}

/// Long task: fetching data, expensive computation, image processing
/// Concurrent queue
DispatchQueue.global().async {
//    print("global queue")
}

/// animations
DispatchQueue.global(qos: .userInteractive).async {
//    print("global queue")
}

/// networking calls
DispatchQueue.global(qos: .background).async {
//    print("global queue")
}

for num in 0...10 {
    DispatchQueue.global().async {
        print(num)
    }
}

func fetchData(closure: @escaping (String) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        print("after two seconds")
        closure("In Closure: got data")
    }
}

DispatchQueue.global().async {
    fetchData(closure: { value in
        DispatchQueue.main.async {
            print(value)
        }
    })
}

class Some {
    var value = "no value"
    
    func start() {
        let updateClosure: (String) -> Void = { someString in
            print(someString)
            self.value = "new data"
        }
        fetchData(closure: updateClosure)
    }
}

let some = Some()
some.start()
some.value

DispatchQueue.global()
DispatchQueue.main

let serialQueue = DispatchQueue(label: "lukeRave.project.serial")
let concQueue = DispatchQueue(label: "lukeRave.project.concurrent", attributes: .concurrent)

serialQueue.async {
    /// task
}
