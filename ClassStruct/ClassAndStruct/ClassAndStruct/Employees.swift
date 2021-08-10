//
//  Employees.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

class Employee {
    var payRate: PayRate
    var role: Role
    var hoursWorked: Int = 0
        
    init(role: Role, payRate: PayRate) {
        self.role = role
        self.payRate = payRate
    }
    
    func addToHoursWorked(hours: Int) {
        self.hoursWorked = self.hoursWorked + hours
    }
    
    func attempt(task: inout Task) {
        if self.role == task.roleReq {
            if self.hoursWorked + task.timeReq < 40 {
                self.addToHoursWorked(hours: task.timeReq)
                task.setTimeReq(timeLeft: 0)
                task.isComplete = true
            } else {
                let num = task.timeReq + self.hoursWorked - 40
                self.hoursWorked = 40
                task.setTimeReq(timeLeft: abs(num))
            }
        }
    }
}
