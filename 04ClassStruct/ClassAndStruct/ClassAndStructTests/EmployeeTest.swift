//
//  EmployeeTest.swift
//  ClassAndStructTests
//
//  Created by Luat on 8/5/21.
//

import XCTest
@testable import ClassAndStruct

class EmployeeTest: XCTestCase {
    
    var employee = Employee(role: .iOSDeveloper, payRate: .normal)
    
    func testAddToHoursWorked() {
        XCTAssertEqual(employee.hoursWorked, 0)
        
        employee.addToHoursWorked(hours: 10)
        
        XCTAssertEqual(employee.hoursWorked, 10)
    }
   
    func testAttemptTask10Hours() {
        var task = Task(timeReq: 10, roleReq: .iOSDeveloper)
        
        employee.attempt(task: &task)
        
        XCTAssertEqual(employee.hoursWorked, 10)
        XCTAssertEqual(task.timeReq, 0)
    }
    
    func testAttemptTask40Hours() {
        var task = Task(timeReq: 40, roleReq: .iOSDeveloper)
        
        employee.attempt(task: &task)
        
        XCTAssertEqual(employee.hoursWorked, 40)
        XCTAssertEqual(task.timeReq, 0)
    }
    
    func testAttemptTask60Hours() {
        var task = Task(timeReq: 60, roleReq: .iOSDeveloper)
        
        employee.attempt(task: &task)
        
        XCTAssertEqual(employee.hoursWorked, 40)
        XCTAssertEqual(task.timeReq, 20)
    }
    
    func testAttemptTask30HourTwoTimes() {
        var taskA = Task(timeReq: 30, roleReq: .iOSDeveloper)
        var taskB = Task(timeReq: 30, roleReq: .iOSDeveloper)
        
        employee.attempt(task: &taskA)
        
        XCTAssertEqual(employee.hoursWorked, 30)
        XCTAssertEqual(taskA.timeReq, 0)
        
        employee.attempt(task: &taskB)
        
        XCTAssertEqual(employee.hoursWorked, 40)
        XCTAssertEqual(taskB.timeReq, 20)
    }
}
