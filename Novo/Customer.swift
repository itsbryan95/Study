//
//  Customer.swift
//  
//
//  Created by Bryan Lee on 8/10/21.
//

import Foundation

protocol CustomerProtocol {
    var name: String { get }
    var vehicle: VehicleProtocol { get set }
    mutating func giveCarToMechanic(vehicle: VehicleProtocol, inspectionNum: Int, mechanic: inout Mechanic)
}

struct Customer {
    var name : String
    var vehicle : VehicleProtocol?
    
    mutating func giveCarToMechanic(vehicle: VehicleProtocol, inspectionNum: Int, mechanic: inout Mechanic) {
        mechanic.addToInsepctionQueue(vehicle: vehicle, inspectionNum: inspectionNum)
//        self.vehicle = nil
        print(self)
    }
}


