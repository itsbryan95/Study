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
        if task.timeReq + hoursWorked > 40 {
            let hoursDone = 40 - hoursWorked
            addToHoursWorked(hours: hoursDone)
            let timeLeft = task.timeReq - hoursDone
            task.setTimeReq(timeLeft: timeLeft)
        } else {
            let hoursDone = task.timeReq
            addToHoursWorked(hours: hoursDone)
            task.setTimeReq(timeLeft: 0)
            task.setIsComplete(status: true)
        }
    }
}
