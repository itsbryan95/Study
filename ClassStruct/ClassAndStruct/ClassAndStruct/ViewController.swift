//
//  ViewController.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import UIKit

/**
 Design
 
 1) Struct Task
 • Properties:
     - timeReq: Int
     - roleReq: Role
     - isValid: Bool  (set default to be false)
     - isCompleted: Bool (set default to be false)
 •  Functions
     -  setIsValid(status:)
         • change isValid to status
     -  setIsComplete(status:Bool)
         • change isComplete to status
     -  setTimeReq(timeLeft:)
         • Reduce the timeReq property to timeLeft
 2) Class Employee
 • Properties:
     - payRate: PayRate (enum)
     - role: Role (enum)
     - hoursWorked: Int
         • Can't work more than 40 hours a week
 •  Functions
     - init Function ()
     - attempt(task: Task)
         • Task can be attempted if employee has same Role as task
         • Add the hours required to finish task to employee's hoursWorked (up to 40)
         • Reduce the task's timeReq to 0 if possible, or by num hours worked
 
 3) Team: Manages employees and tasks
 •  Properties:
     - employees: [Employee]
     - taskList: [Task]
 • Functions
     - add(employee:)
         • adds an employee to employees array
     - add(task:)
         • adds a task to taskList
     - startWeek()
         • simulates a 40 hour work week
         • go thru team's taskList and call validate(taskNum:)
     - validate(taskNum:)
         • check if team member has roleReq
         • set task property isValid to true if valid
         • call assign(task:to) for the first appropriate employee on the team
     - assign(task: to)
         • calls employee attempt(task:)
     - weeksTillComplete(task:) -> Int
         • returns number of weeks required for the current team to complete all tasks
         •  should consider number of valid employee and their current hours worked
         •  can be called before startWeek and after startWeek
     - printMoney() should print "BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" if all tasks are completed

 */

class ViewController: UIViewController {
    
    let myTeam = Team()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTasks()
        setupTeam()
        myTeam.startWeek()
        
        if myTeam.allTasksCompleted() {
            myTeam.printMoney()
        }
    }
    
    func setupTasks() {
//        let iOSTask     = Task(timeReq: 20,
//                               roleReq: .iOSDeveloper)
//        let androidTask = Task(timeReq: 30,
//                               roleReq: .Architech)
//
//        myTeam.add(task: iOSTask)
//        myTeam.add(task: androidTask)
    }
    
    func setupTeam() {
//        let iOSDev      = Employee(role: .iOSDeveloper,
//                                   payRate: .normal)
//        let androidDev  = Employee(role: .AndroidDeveloper,
//                                   payRate: .low)
//
//        myTeam.add(employee: iOSDev)
//        myTeam.add(employee: androidDev)
    }
    
}

