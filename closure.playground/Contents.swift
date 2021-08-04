 import UIKit

let multiplyByTwo = [1,2,3,4].map { num in
    num * 2
}
let multiplyByTwoShort = [1,2,3,4].map { $0 * 2 }

let reduced = [1,2,3,4].reduce(0) { $0 + $1 }
print(reduced)

[].map({ num in num * 2 })
print(multiplyByTwo)

let myClosure: (Int) -> Int = { num in
    return num * 2
}

let multiplyByTwoClos = [1,2,3,4].map(myClosure)
print(multiplyByTwoClos)

let addTenClosure: (Int) -> Int = { num in
    return num + 10
}
func doMath(arr: [Int], mathClosure: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for num in arr {
        let modifiedNum = mathClosure(num)
        result.append(modifiedNum)
    }
    return result
}
let originalNums = [1,2,3,4,5]
//let modifiedNums = doMath(arr: originalNums, mathClosure: { num in
//        return num + 10
//})
let modifiedNums = doMath(arr: originalNums) { num in return num + 10
}
//let modifiedNums = doMath(arr: originalNums, mathClosure: addTenClosure)
print(modifiedNums)
 
 
 // MARK : - Sets
 
 
 var mySet: Set<Int> = [1,2,3,4]//print(mySet.first)
 var myTenSet: Set<Int> = [1, 10, 11, 12]
 print("count: ", mySet.count)
 
 for ele in mySet {
    print(ele)
 }

 mySet.union(myTenSet)
 mySet.intersection(myTenSet)
 mySet.subtract(myTenSet)
 
 // MARK : - Dictionary
 
 var counter: [Int: Int] = [:]
 
 for num in 0...10 {
    counter[num] = num + 10
 }
 
 counter[0] = 10
 let zeroValue = counter[5]
 if let zeroValue = zeroValue {
    print("zeroValue:", zeroValue)
 }
 
 print(counter.keys)
 print(counter.values)
 for (index, element) in counter.enumerated() {
    print("index:", index, "key:", element.0, "value:", element.1)
 }
 
 for element in counter {
    print("key:", element.0, "value:", element.1)
 }
 
 for(key, value) in counter {
    print("key:", key, "value:", value)
 }
 
 let nums = [1,1,2,2,4]
 var numCounter: [Int: Int] = [:]
 for num in nums {
    if let count = numCounter[num] {
        numCounter[num] = count + 1
    } else {
        numCounter[num] = 1
    }
 }
 
 
 // MARK: - Optionals
 
 let firstEle = mySet.first
 /// 1. force unwrap (worst method but fastes)
 //print("unwrapped", firstEle!)
 
 /// 2. optional binding
 if let num = firstEle {
    print(num, "first ele has value")
 } else {
    print("first ele is nil")
 }
 
 guard let num = firstEle else {
    fatalError("prevent execution from moving on:")
//    return
 }
 
 /// 3. nil coalescing(convenient) gives you a value if nil
 print(firstEle ?? 0)
 print(firstEle ?? true)
 
 let strSet : Set<String> = ["a", "b"]
 let firstStr = strSet.first
 print("First String:", firstStr ?? "No string here")
 
 /// 4. optional chain (doesnt actually unwrap)
 struct Person {
    let name : String
    let location: Location?
 }
 struct Location {
    let address: String
 }
// class Person {
//    let name: String
//    init(name: String) {
//        self.name= name
//    }
// }
 
 let myLoc = Location(address: "philly")
 
 let optLuke: Person? = Person(name: "luke", location: myLoc)
 let name = optLuke?.name
 let loc = optLuke?.location?.address

///almost same
// if let person = optLuke {
//    if let location = person.location {
//        let address = location.address
//    }
// }
 
 if let name = name {
    print("name exists:", name)
 }
 
 /// 5. implicity unwrapped (implied force unwrapped)
 
 let optString : String! = "opt Str"
 print("opt string: ", optString)
 let myNewStr : String = optString
 print("my new str:", myNewStr)
 
 print(optString!)
 
 
 
 
 
 


