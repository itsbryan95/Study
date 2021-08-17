//
//  Company.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Team {
    
    var employees: [Employee] = []
    var taskList: [Task] = []
    
    func add(employee: Employee) {
        employees.append(employee)
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
    func startWeek() {

        for(index, _) in taskList.enumerated() {

        for index in 0..<taskList.count {

            validate(taskNum: index)
        }
    }
    }
    
    func validate(taskNum: Int) {

//        for employee in employees {
//            if taskList[taskNum].roleReq == employee.role {
//                taskList[taskNum].isValid = true
//                assign(taskNum: taskNum, to: employee)

        let task = taskList[taskNum]
        for employee in employees {
            if employee.role == task.roleReq {
                taskList[taskNum].isValid = true
                assign(taskNum: taskNum, to: employee)
                break
            } else {
                taskList[taskNum].isValid = false
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        for task in taskList {
            if task.isComplete == false {
                return false
            }
        }
        return true
//        taskList.filter { $0.isComplete }.count == taskList.count

    }
    
//    • returns number of weeks required for the current team to complete all tasks
//    •  should consider number of valid employee and their current hours worked
//    •  can be called before startWeek and after startWeek
    
    func weeksTillComplete() -> Int {
        var hoursTotal: [Role: Int] = [:]



//        print(taskList)

        for task in taskList {
            if let hours = hoursTotal[task.roleReq] {
                hoursTotal[task.roleReq] = hours + task.timeReq
            } else {
                hoursTotal[task.roleReq] = task.timeReq
            }
        }


        let hoursMax = hoursTotal.values.max() ?? 0
        let weeks = (Double(hoursMax) / 40).rounded(.up)
        return Int(weeks)

    }
    //        var hoursReq : Int = 0
    //        var roleReq: Role = taskList[0].roleReq
    //        var hoursWorked: Int = 0
    //        var hoursAvailThisWeek : Int = 0
    //
    //
    //        for task in taskList {
    //            if(task.timeReq > hoursReq){
    //                hoursReq = task.timeReq
    //                roleReq = task.roleReq
    //            }
    //        }
    //
    //        for employee in employees {
    //            if employee.role == roleReq {
    //                hoursWorked = hoursWorked + employee.hoursWorked
    //            }
    //        }
    //        var totalHours : Double = Double(hoursReq - hoursWorked)
    //        return Int((totalHours/40).rounded(.up))

    func printMoney() {
        print("BRRRRRRRRRRRRRRRRRRR")
    }
    
}
