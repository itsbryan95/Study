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
        
        return []
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        
        return []
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        return []
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        return [:]
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        return "."
    }
    
    /// O(n) time: avoid nested for loops
    func findPairs(nums: [Int]) -> Int {
        
        return 0
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        return []
    }
    
    /// Optionals
    /// Unwrap using optional binding: if let
    func unwrap(optional: Int?) -> Int {
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    func unwrap(optional: String?) -> String {
        return ""
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        
        return 0
    }
    
    /// Create a url from a string address, avoid force unwrapping
    func createURL(from address: String?) -> URL {
        
        
        /// Just an example url, don't need this return value
        return Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        
        
        return []
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        
        return 0
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        
        return 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        
        return 0
    }
    
}
