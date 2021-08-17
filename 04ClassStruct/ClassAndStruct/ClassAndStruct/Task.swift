//
//  Task.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

struct Task {

    var timeReq: Int
    let roleReq: Role
    var isValid: Bool = false
    var isComplete: Bool = false
    

    init(timeReq: Int, roleReq: Role ) {
        self.timeReq = timeReq
        self.roleReq = roleReq
    }
    
    mutating func setIsComplete(status: Bool) {
        self.isComplete = status
    }
    
    mutating func setIsValid(status: Bool) {
        self.isValid = status
    }
    
    mutating func setTimeReq(timeLeft: Int) {
        self.timeReq = timeLeft

    func setIsComplete(status: Bool) {
        self.isComplete = status
    }
    
    func setIsValid(status: Bool) {
        self.isValid = status
    }
    
    func setTimeReq(timeLeft: Int) {
        self.timeReq = timeLeft
    }
}
}
