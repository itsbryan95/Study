import UIKit

var value: String = "no value"
let semaphore = DispatchSemaphore(value: 0)

//print("start of long task")
//DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//    value = "new value 2 sec"
//    semaphore.signal()
//    print("end of long task 2 sec")
//}
//
//DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
//    value = "new value 1 sec"
//    semaphore.signal()
//    print("end of long task 1 sec")
//}
//
//semaphore.wait(timeout: .now() + 5)
//print(value)

//let group = DispatchGroup()
//
//print("start of ALL TASKS")
//
//group.enter()
//DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//    value = "new value 2 sec"
//    print("end of long task 2 sec")
//    group.leave()
//}
//
//group.enter()
//DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
//    value = "new value 1 sec"
//    print("end of long task 1 sec")
//    group.leave()
//}
//
//group.notify(queue: DispatchQueue.main) {
//    print("End of ALL TASKS")
//}
//
//print("after group.notify")
//
//func fetchData(group: DispatchGroup) {
//    group.enter()
//    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
//        group.leave()
//    }
//}

/// Main queue, serial
let queue = DispatchQueue.main

queue.async {
    /// your task here
}

//queue.sync {
    /// your task here
    /// sync for creating thread safe access
//}


/// Background queues, Concurrent
let interactiveQueue = DispatchQueue.global(qos: .userInteractive)
DispatchQueue.global(qos: .utility).async {
    /// add your task here
}

let myConQ = DispatchQueue(label: "asdf",attributes: .concurrent)


let urlOne = URL(string: "https://www.google.com")
let urlTwo = URL(string: "https://www.yahoo.com")
let urlThree = URL(string: "https://www.amazon.com")

guard let urlOne = urlOne, let urlTwo = urlTwo, let urlThree = urlThree else {
    fatalError()
}

let group = DispatchGroup()

group.enter()
let taskOne = URLSession.shared.dataTask(with: urlOne) { (data, response, error) in
    defer {
        group.leave()
    }
    print("google", data ?? "")
    print("task one done")
}

/// URLSession and networking calls are always concurrent / global queue
group.enter()
let taskTwo = URLSession.shared.dataTask(with: urlTwo) { (data, response, error) in
    print("yahoo:", data ?? "")
    print("task two done")
    group.leave()
}

taskOne.resume()
taskTwo.resume()

let taskThree = URLSession.shared.dataTask(with: urlThree) { (data, response, error) in
    print("amazon:", data ?? "")
    print("task three done")
}

group.notify(queue: DispatchQueue.global()) {
    print("taskOne and taskTwo are done")
    print("starting task three")
    taskThree.resume()
}


