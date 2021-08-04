//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {
    
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    /// input "hello" should print "Hello"
    func printUpperCase(word: String) {
        let caps = word.uppercased()
        print(caps)
        
    }
    //printUpperCase(word: "bob")
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for letter in word
        {
            print(letter)
        }
    }
    
    /// Using for-in-enumerated(), print odd-index chars in word
    func printOddCharsEnumerated(word: String) {
        let hIndex = word.startIndex
        for num in 0..<word.count - 1{
            if num % 2 == 0{
                let nextIndex = word.index(hIndex, offsetBy: num)
                print(word[nextIndex])
            }
        }
    }
    
    /// Using for-in-stride and string.index, print odd-index chars in word
    func printOddCharsStrideIndex(word: String) {
        for num in stride(from: 0, to: word.count, by: 2) {
            let index = word.index(word.startIndex, offsetBy: num)//must use offset to define location in string, no ints jack
            print(word[index])
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
        let rest = word.dropFirst()
        let fLetter = word.startIndex
        let starter = String(word[fLetter])
        var pigLatin = ""
        
        let vowels: [String] = ["a", "e", "i", "o", "u"]
        if vowels.contains(starter){
            pigLatin += word + "yay"
            
        }else{
            pigLatin += rest + starter + "ay"
        }
        
        print(pigLatin)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    func isPalindrome(word: String) -> Bool {
        //var backsy = ""
        //build word in reverse
        //for num in stride(from: word.count, to: 0, by: -1) {
          //  let index = word.index(word.endIndex, offsetBy: num)
            
            //backsy += String(word[index])
        //}
        //compare
        //if word == backsy{
          //  return true
        //}else{
          //  return false
    
        //}
    //}
        let letterTotal = word.count
        let halfpoint = word.count/2
        let front = word.startIndex
        let end = word.endIndex
        
        for num in 0...halfpoint{
            let leftPointer = word.index(front, offsetBy: num)
            let rightPointer = word.index(end, offsetBy: num * -1)
            
            if leftPointer == rightPointer{
                continue
            }
            else{
                return false
            }
        }
            return true
        }
        
        
        
        
}
