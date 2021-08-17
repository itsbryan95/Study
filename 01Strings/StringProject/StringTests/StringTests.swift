//
//  StringTests.swift
//  StringTests
//
//  Created by Luat on 8/2/21.
//

import XCTest
@testable import String

class StringTests: XCTestCase {

    let tester = Tester.shared
    var input = "five"
    
    override func setUpWithError() throws {
        tester.printedString = ""
        tester.sequentialPrints = []
    }
    
    func testPrintWord() throws {
        let expected = "five"
        
        tester.printWord(word: input)
        let result = tester.printedString
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testPrintLetters() throws {
        let expected = ["f", "i", "v", "e"]
        
        tester.printLetters(word: input)
        let result = tester.sequentialPrints
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testUpperCase() {
        let expected = "FIVE"
        
        tester.printUpperCase(word: input)
        let result = tester.printedString
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testOddCharsEnumerated() {
        let expected = ["f", "v"]
        
        tester.printOddCharsEnumerated(word: input)
        let result = tester.sequentialPrints
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testOddCharsStrideIndex() {
        let expected = ["f", "v"]
        
        tester.printOddCharsStrideIndex(word: input)
        let result = tester.sequentialPrints
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testPalindromeTrue() {
        input = "tacocat"
        let expected = true
        
        let result = tester.isPalindrome(word: input)
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    func testPalindromeFalse() {
        input = "racingcar"
        let expected = false
        
        let result = tester.isPalindrome(word: input)
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testPigLatin() {
        let expected = "ivefay"
        
        tester.printPigLatin(word: input)
        let result = tester.printedString
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testPigLatinVowel() {
        input = "one"
        let expected = "oneyay"
        
        tester.printPigLatin(word: input)
        let result = tester.printedString
        
        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
}
