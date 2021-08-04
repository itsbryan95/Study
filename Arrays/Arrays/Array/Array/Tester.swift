//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int]{
        let mappedArr = original.map { num in
            return num * 2
        }
        

      return mappedArr
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var arr: [Int] = []
        var index: Int = array.count/2
        if index % 2 == 0 {
            index = index + 1
        }
        
        for i in index...array.count - 1 {
            arr.append(array[i])
        }
        
        return arr
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        
        var arr: [Int] = []
        
        for i in start...end {
            arr.append(i)
        }
        
        return arr
    }

    /**
        4. Create this 2-D array
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
        var count: Int = 1
        var arr: [Int] = []
        var finalArray: [[Int]] = []
        for i in 1...9 {
            if(arr.count == 3) {
                finalArray.append(arr)
    //            count = count + 1
                arr = []
            }
                arr.append(count)
                count = count + 1
            if(i == 9) {
                finalArray.append(arr)
            }
            
        }
      return finalArray
        
    }

    /// 5. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {

        var arr: [Int] = nums
        var pairs: Int = 0
        for num in nums {
            var firstNum: Int = num
            arr.removeFirst()
            for num2 in arr {
                if(firstNum + num2 == 0) {
                    pairs += 1
                }
            }
        }

      return pairs
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {

        var str: String = word
        var arr: [Int] = []
        
        for (index, ele) in str.enumerated() {
            if(ele == character) {
                arr.append(index)
            }
        }
        return arr
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex. [ I, I, O] -> 2
     */
    func minimumChairs(array: [Character]) -> Int {
        
        var need : Int = 0
        var open : Int = 0
        
        for char in array {
            if char == "I" {
                need += 1
            } else {
                open += 1
                if need > open {
                    need -= 1
                }
            }
        }
        return need
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        return ""
    }
    
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5
     */
    func maxProfit(array: [Int]) -> Int {
        
        var min : Int = array[0]
        var max : Int = 0
        var index : Int = 0
        
        for (ind, num) in array.enumerated() {
            if (num < min ) {
                min = num
                index = ind
                print(index)
            }
        }
            
        for i in index + 1...array.count - 1 {
            if(max < array[i]) {
                max = array[i]
            }
        }
        
        return max - min
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        var dict: [Int: Int] = [:]
        var arr: [Int] = []
        
        for (index, ele) in array.enumerated() {
            if(dict[ele] == nil) {
                dict[ele] = index + 1
            }
        }
        
        for num in array {
            arr.append(dict[num].unsafelyUnwrapped)
        }
        
        return arr
    }
}
