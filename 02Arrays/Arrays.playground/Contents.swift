import UIKit

var greeting = "Hello, playground"


func testing() {
    let moneyLeft = 2
    
    if moneyLeft > 5 {
        
    } else {
        
    }
    print("after if statment")
    
    guard moneyLeft > 5 else {
        print("outta money")
        return
    }
    
    print("after guard statment")
}
testing()

let moneyLeft = 2

moneyLeft > 5 ? print("greater 5") : print("lesser 5")

let myInt: Int = 9
let myInt8: Int8 = 100
let myInt32: Int32 = 100
let myInt64: Int64 = 100
let uSign: UInt8 = 255
print(uSign)
print("int8 max", Int8.max)
print("int16 max", Int16.max)


let doub: Double = 10.0 // 64 bits
let float: Float = 10.0 // 32 bits

let xPostion: CGFloat = 10.0

var genArr: [Any] = [1, "adf", []]
var intArr = [1,2,3,4]
//intArr.append(5)
//intArr.append("5")   /// Can't do this

let firstInt = intArr[0]
let firstGen = genArr[0]
let castedGen = firstGen as! Int

for ele in genArr {
    print(ele)
}

for (index, ele) in intArr.enumerated() {
    print(index, ele)
}

let mappedArr = intArr.map { element in
    return element + 10
}
print(mappedArr)
print(intArr)

let filteredArr = intArr.filter { element in
    return element % 2 == 0
}
print(filteredArr)

let reduced = intArr.reduce(1) { total, element in
    return total * element
}
print(reduced)


