//
//  ArrayTests.swift
//  ArrayTests
//
//  Created by Luat on 5/19/21.
//

import XCTest
@testable import Array

class ArrayTests: XCTestCase {

    let tester = Tester.shared

    func testMultiplyByTwo() throws {
        let input = [1,2,3]
        let expected = [2,4,6]
    
        let result = tester.multiplyByTwo(numbers: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testLastHalf() throws {
        let input = [1,2,3,4,5]
        let expected = [4,5]
    
        let result = tester.lastHalf(array: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testcreateArray() throws {
        let expected = [10, 11, 12, 13]
    
        let result = tester.createArray(from: 10, to: 13)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testCreate2DArray() throws {
        let expected = [[1,2,3],
                        [4,5,6],
                        [7,8,9]]
    
        let result = tester.create2DArray()
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testFindPairs() throws {
        let input = [1,2,3,-1,-2,-4]
        let expected = 2
    
        let result = tester.findPairs(nums: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }

    func testPositionsOfCharsInWord() {
        let expected = [2,3]
    
        let result = tester.positionsOf(character: "l", in: "hello")
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testMinimumChairs() {
        let input: [Character] = ["I", "O", "I", "I", "I", "O"]
        let expected = 3
    
        let result = tester.minimumChairs(array: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testPigSentence() {
        let input = "welcome to day one"
        let expected = "elcomeway otay ayday oneyay"

        let result =  tester.pigLatinSentence(sentence: input)

        XCTAssertEqual(result, expected, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testMaxProfit() {
        let prices = [7,1,5,3,6,4]
        let expected = 5
    
        let result = tester.maxProfit(array: prices)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    func testReduceDistanceKeepPriority() {
        let input = [1, 4, 8, 4]
        let expected = [1, 2, 3, 2]
    
        let result = tester.reduceDistanceKeepPriority(array: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
}
