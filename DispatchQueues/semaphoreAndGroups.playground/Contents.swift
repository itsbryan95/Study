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

let group = DispatchGroup()

print("start of ALL TASKS")

group.enter()
DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
    value = "new value 2 sec"
    print("end of long task 2 sec")
    group.leave()
}

group.enter()
DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
    value = "new value 1 sec"
    print("end of long task 1 sec")
    group.leave()
}

group.notify(queue: DispatchQueue.main) {
    print("End of ALL TASKS")
}

print("after group.notify")

func fetchData(group: DispatchGroup) {
    group.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        group.leave()
    }
}
