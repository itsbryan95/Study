//
//  TaskTest.swift
//  ClassAndStructTests
//
//  Created by Luat on 8/5/21.
//

import XCTest
@testable import ClassAndStruct

class TaskTest: XCTestCase {

    var task = Task(timeReq: 10, roleReq: .iOSDeveloper)
    
    func testDefaultValues() {
        XCTAssertEqual(task.isValid, false)
        XCTAssertEqual(task.isComplete, false)
    }
    
    func testSetIsValid() {
        XCTAssertEqual(task.isValid, false)
        
        task.setIsValid(status: true)
        
        XCTAssertEqual(task.isValid, true)
    }

    func testSetIsComplete() {
        XCTAssertEqual(task.isComplete, false)
        
        task.setIsComplete(status: true)
        
        XCTAssertEqual(task.isComplete, true)
    }
    
    func testSetTimeReq() {
        XCTAssertEqual(task.timeReq, 10)
        
        task.setTimeReq(timeLeft: 0)
        
        XCTAssertEqual(task.timeReq, 0)
    }

    func testTaskIsNotClassType() {
        var taskA = task
        let taskB = taskA
        
        XCTAssertEqual(taskA.isComplete, false)
        
        taskA.setIsComplete(status: true)
        
        XCTAssertEqual(taskA.isComplete, true)
        XCTAssertEqual(taskB.isComplete, false)
        
    }
    
}
