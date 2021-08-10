//
//  TeamTest.swift
//  ClassAndStructTests
//
//  Created by Luat on 8/5/21.
//

import XCTest
@testable import ClassAndStruct

class TeamTest: XCTestCase {

    let team = Team()
    let task = Task(timeReq: 10, roleReq: .iOSDeveloper)
    let employee = Employee(role: .iOSDeveloper, payRate: .high)
    
    func testAddTask() {
        team.add(task: task)
        team.add(task: task)
        
        XCTAssertEqual(team.taskList.count, 2)
        
        if let roleReq = team.taskList.first?.roleReq {
            XCTAssertEqual(roleReq, .iOSDeveloper)
        } else {
            XCTFail()
        }
    }
    
    func testAddEmployee() {
        
        team.add(employee: employee)
        
        XCTAssertEqual(team.employees.count, 1)
    }
    
    func testStart() {
        let teamFake = TeamFake()
        
        teamFake.add(task: task)
        teamFake.add(task: task)
        teamFake.add(task: task)
        
        teamFake.startWeek()
        
        let numValidatedCalled = teamFake.validateCalled
        
        XCTAssertEqual(numValidatedCalled, 3)
    }
    
    func testValidate() {
        team.add(task: task)
        
        team.startWeek()
        
        guard let shouldBeInvalid = team.taskList.first?.isValid else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(shouldBeInvalid, false)
        
        team.add(employee: employee)
        
        team.startWeek()
        
        let shouldBeValid = team.taskList[0].isValid
        
        XCTAssertEqual(shouldBeValid, true)
    }
    
    func testAssign() {
        let employeeFake = EmployeeFake(role: .iOSDeveloper, payRate: .normal)
        
        team.add(employee: employeeFake)
        team.add(task: task)
        
        team.assign(taskNum: 0, to: employeeFake)
        
        let numAttemptCalled = employeeFake.attemptCalled
        
        XCTAssertEqual(numAttemptCalled, 1)
        
    }
    
    func testAllTasksCompleted() {
        team.add(task: task)
        
        team.add(employee: employee)
        
        team.startWeek()
        
        XCTAssertTrue(team.allTasksCompleted())
        
        let longTask = Task(timeReq: 40, roleReq: .iOSDeveloper)
        team.add(task: longTask)
        
        XCTAssertFalse(team.allTasksCompleted())
    }
    
    func testWeeksTillCompleteShortTask() {
        team.add(employee: employee)
        team.add(task: task)
        
        XCTAssertEqual(team.weeksTillComplete(), 1)
        
        team.startWeek()
        
        XCTAssertEqual(team.weeksTillComplete(), 0)
    }
    
    func testWeeksTillComplete() {
        team.add(employee: employee)
        
        let longTask = Task(timeReq: 70, roleReq: .iOSDeveloper)
        team.add(task: task)
        team.add(task: task)
        team.add(task: longTask)

        XCTAssertEqual(team.weeksTillComplete(), 3)
        
        team.startWeek()
        
        XCTAssertEqual(team.weeksTillComplete(), 2)
    }
    
    func testPrintMoney() {
        team.printMoney()
        
        let result = Tester.shared.printedString
        
        XCTAssertTrue(result.contains("BRRRRRRRR"), "\n Result: \(result) should contain: \"BRRRRRRRR\"")
    }
    
    
    class TeamFake: Team {
        var validateCalled = 0
        override func validate(taskNum: Int) {
            validateCalled += 1
        }
    }
    
    class EmployeeFake: Employee {
        var attemptCalled = 0
        override func attempt(task: inout Task) {
            attemptCalled += 1
        }
    }

}
