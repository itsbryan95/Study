import UIKit

// MARK: - Set

//let arr = [1, 1, 2, 3, 4]
////print(arr[0])
//
//var mySet: Set<Int> = [1,1,2,3,4]
//var myEmptySet: Set<Int> = []
////print(mySet.first)
//var myTenSet: Set<Int> = [1, 10,11,12]
//print("count: ", mySet.count)
//
//for ele in mySet {
//    print(ele)
//}
//mySet.union(myTenSet)
//mySet.intersection(myTenSet)
//mySet.subtract(myTenSet)
//
//// MARK: - Dictionary
//
//var counter: [Int: Int] = [:]
//
//for num in 3...6 {
//    counter[num] = num + 10
//}
//
//let zeroValue = counter[5]
//if let zeroValue = zeroValue {
//    print("zeroValue:", zeroValue)
//}
//
//print(counter.keys)
//print(counter.values)
//for element in counter {
//    print("element.0:", element.0, "elment.1:", element.1)
//}
//
//for (key, value) in counter {
//    print("key:", key, "value:", value)
//}
//
//let nums = [1,1,2,4]
//var numCounter: [Int: Int] = [:]
//for num in nums {
////    numCounter[num] += 1
//    if let count = numCounter[num] {
//        numCounter[num] = count + 1
//    } else {
//        numCounter[num] = 1
//    }
//}
//print(numCounter)
//
//// MARK: - Optionals
//
//let firstEle = mySet.first
///// 1. Force Unwrap (worst method but fastest)
//print("Forced Unwrapped", firstEle!)
//
///// 2. Optional binding (safe way)
//if let num = firstEle {
//    print(num, "first ele has value")
//} else {
//    print("first ele is nil")
//}
//
//guard let num = firstEle else {
//   fatalError("prevent execution from moving on")
//}
//print("Optional Binding:", num)
//
///// 3. Nil coalescing (convenient)
//print(firstEle ?? 0)
//
//let strSet: Set<String> = []
//let firstStr = strSet.first
//print("First String:", firstStr ?? "No string here")
//
///// 4. Optional Chaining (doesn't actually unwrap)
//class Person {
//    let name: String
//    let location: Location?
//    init(name: String, location: Location?) {
//        self.name = name
//        self.location = location
//    }
//
//}
//struct Location {
//    let address: String
//}
//let myLoc = Location(address: "Philly")
//let optLuke: Person? = Person(name: "luke", location: myLoc)
//let name = optLuke?.name
//let address = optLuke?.location?.address
//
//if let person = optLuke {
//    if let location = person.location {
//        let address = location.address
//        print(address)
//    }
//}
//
//print(name)
//if let name = name {
//    print("name exists:", name)
//}

///// 5. Implicitly unwrapped (implied force unwrapped)
//
let optString: String! = "opt Str"
print("opt string:", optString)
let myNewStr: String = optString
print("my new str:", myNewStr)
//
//func createCounter(string: String) -> [Character: Int] {
//    var emptyDict: [Character: Int] = [:]
//    let trimmed = string.replacingOccurrences(of: " ", with: "")
//    print(trimmed)
//
//    for letter in trimmed {
//        if emptyDict[letter] == nil {
//            emptyDict[letter] = 1
//        } else {
//            emptyDict[letter]! += 1
//        }
//
//    }
//    print(emptyDict)
//    return emptyDict
//}
//
//createCounter(string: "aa bb c")
//
//
//func mostFrequentLetter(string: String) -> Character {
//    var emptyDict: [Character: Int] = [:]
//    var greatestValue : Int = 0
//    var greatestLetter : Character? = nil
//
//    for letter in string {
//        if var letter1 = emptyDict[letter] {
//            emptyDict[letter] = letter1 + 1
//        } else {
//            emptyDict[letter] = 1
//        }
//    }
//
//    for element in emptyDict {
//        if element.1 > greatestValue {
//            greatestValue = element.1
//            greatestLetter = element.0
//        }
//    }
//
//   return greatestLetter!
//}
//
//mostFrequentLetter(string: "aa bbb c")
//
//func findPairs(nums: [Int]) -> Int {
//    var set: Set<Int> = []
//    var count : Int = 0
//    for num in nums {
//        set.insert(num)
//        if(set.contains(num * -1)) {
//            count = count + 1
//        }
//    }
//    print(count)
//    return count
//}
////
//findPairs(nums: [1, 2, 3, -1, -2, -4])
//
//func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
//
//    var dict: [Int: Int] = [:]
//    var sortedArr = array
//    var newArr : [Int] = []
//    var distance : Int = 1
//    sortedArr.sort()
//    print(sortedArr)
//    for num in sortedArr {
//        newArr.append(distance)
//        distance = distance + 1
//        print(newArr)
//    }
//
//    for num in sortedArr {
//
//    }
//
//    for (index, element) in sortedArr.enumerated() {
//      dict[]
//    }
//
//    return [0]
//
//}
//
//reduceDistanceKeepPriority(array: [8, 6, 2, 4] )

//func unwrap(optional: [Int]?) -> Int {
//
//    var opt = optional ?? []
//    return opt[0]
//}
//
//unwrap(optional: [10])
//
//func createURL(from address: String?) -> URL {
//    let str = address ?? ""
//    var url = URL(string: str)!
//
//    return url
//}
//
//createURL(from: "")

//func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
//    let unwrappedKey = key ?? 0
//    let unwrappedDict = optional ?? [:]
//    print(unwrappedDict)
//
//    return unwrappedDict[unwrappedKey]!
//}
//
//unwrap(optional: [1: 100], key: 1)

func unwrap(optional: [[Int]?]?) -> Int {
    print(optional?[0]?[0])
    
    return optional?[0]?[0] ?? 0
}
unwrap(optional: [[100]])
