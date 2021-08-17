//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {
    /// Creating a git conflict
    /// Adding comment
    ///
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased())
//        word.capitalized
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
    }
    
    /// Using for-in-enumerated(), print odd-position chars in word
    func printOddCharsEnumerated(word: String) {
        for (index, char) in word.enumerated() {
            if index % 2 == 0 {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print odd-position chars in word
    func printOddCharsStrideIndex(word: String) {
        let startIndex = word.startIndex
        for distance in stride(from: 0, to: word.count, by: 2) {
            let nextIndex = word.index(startIndex, offsetBy: distance)
            let letter = word[nextIndex]
            print(letter)
        }
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        let vowels = "aeiou"
        let firstLetter = String(word[word.startIndex])
        if vowels.contains(firstLetter) {
            print(word + "yay")
        } else {
            let truncWord = word.dropFirst()
            print(truncWord + firstLetter + "ay")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        let startIndex = word.startIndex
//        let endIndex = word.endIndex // out of bounds
        let size = word.count
        for num in 0...size/2 {
            let leftIndex = word.index(startIndex, offsetBy: num)
            let rightIndex = word.index(startIndex, offsetBy: size - num - 1 )
            if word[leftIndex] != word[rightIndex] {
                return false
            }
        }
        return true
    }
}
