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



