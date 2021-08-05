//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
        var emptyDict: [Int: Int] = [:]
        var emptyArr: [Int] = []
        
        for num in nums {
            if emptyDict[num] == nil {
                emptyDict[num] = 1
                emptyArr.append(num)
            }
        }
        
        return emptyArr
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var emptyDict: [Int: Int] = [:]
        var femptyArr: [Int] = []
        var semptyArr: [Int] = []
        
        for num in firstNums {
            if emptyDict[num] == nil {
                emptyDict[num] = 1
                femptyArr.append(num)
            }
        }
        
        for num in secondNums {
            if emptyDict[num] != nil {
                semptyArr.append(num)
            }
        }
        
        return semptyArr
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var emptyDict: [Character: Int] = [:]
        var emptyArr: [Character] = []
        
        for letter in firstWord {
            if emptyDict[letter] == nil {
                emptyDict[letter] = 1
            }
        }
        
        for letter in secondWord {
            if emptyDict[letter] != nil {
                emptyArr.append(letter)
            }
        }
        
        
        
        return emptyArr
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var emptyDict: [Character: Int] = [:]
        let trimmed = string.replacingOccurrences(of: " ", with: "")
        
        for letter in trimmed {
            if emptyDict[letter] == nil {
                emptyDict[letter] = 1
            } else {
                emptyDict[letter]! += 1
            }
            
        }
        return emptyDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var emptyDict: [Character: Int] = [:]
        var greatestValue : Int = 0
        var greatestLetter : Character? = nil
        
        for letter in string {
            if let letter1 = emptyDict[letter] {
                emptyDict[letter] = letter1 + 1
            } else {
                emptyDict[letter] = 1
            }
        }
        
        for element in emptyDict {
            if element.1 > greatestValue {
                greatestValue = element.1
                greatestLetter = element.0
            }
        }
        
       return greatestLetter!
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {
        var set: Set<Int> = []
        var count : Int = 0
        for num in nums {
            set.insert(num)
            if(set.contains(num * -1)) {
                count = count + 1
            }
        }
        print(count)
        return count
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
//        var emptyDict: [Int: Int] = [:]
//        var arr: [Int] = []
//        var count : Int = 1
//        let sortedArr = arr.sort()
//
//        for num in array {
//            if emptyDict[num] == nil {
//                emptyDict[num] = count
//                arr.append(count)
//                print(arr)
//            } else {
//                arr.append(emptyDict[num] ?? 1)
//                print(arr)
//            }
//            count = count + 1
//        }
//
        return []
    }
    
    /// Optionals
    /// Unwrap using optional binding: if let
    func unwrap(optional: Int?) -> Int {
        if let optional = optional{
            return optional
        }
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    func unwrap(optional: String?) -> String {
        guard let optional = optional else {
            return ""
        }
        return optional
       
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let opt = optional ?? []
        return opt[0]
    }
    
    /// Create a url from a string address, avoid force unwrapping
    func createURL(from address: String?) -> URL {
        
        let str = address ?? ""
        let url = URL(string: str)!
        
        return url
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var arr : [Int] = []
        
        for num in array {
            if let num = num {
                arr.append(num)
            }
        }
        
        return arr
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        let unwrappedKey = key ?? 0
        let unwrappedDict = optional ?? [:]
        
        return unwrappedDict[unwrappedKey]!
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        
        return optional?[0]?[0] ?? 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        
        return optional!
    }
    
}
