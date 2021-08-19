//
//  Mechanic.swift
//  
//
//  Created by Bryan Lee on 8/10/21.
//

import Foundation


protocol MechanicProtocol {
    mutating func addToInsepctionQueue(vehicle: VehicleProtocol, inspectionNum: Int)
    mutating func inspect(vehicle: inout VehicleProtocol, inspectionNum: Int)
    mutating func repair(vehicle: inout VehicleProtocol, inspectionNum: Int)
    mutating func doAll()
}

struct Mechanic: MechanicProtocol {
    var inspectionArr : [[Int : VehicleProtocol]] = []
    var repairArr : [[Int : VehicleProtocol]] = []
    
    
    mutating func addToInsepctionQueue(vehicle: VehicleProtocol, inspectionNum: Int) {
        var inspectionDict : [Int : VehicleProtocol] = [:]
        
        inspectionDict[inspectionNum] = vehicle
        self.inspectionArr.append(inspectionDict)
    }
    
    
    mutating func inspect(vehicle: inout VehicleProtocol, inspectionNum: Int) {
        if inspectionNum == 0 {
            print("Vehicle with id: \(vehicle.id) and make/model of: \(vehicle.makeModel) has passed all tests")
            vehicle.isComplete = true
            self.inspectionArr.removeFirst()
        } else {
            self.repairArr.append([inspectionNum : vehicle])
            self.inspectionArr.removeFirst()
        }
    }
    
    mutating func repair(vehicle: inout VehicleProtocol, inspectionNum: Int) {
        if inspectionNum == 1 {
            /// repair acceleration
            print("repairng acceleration...")
            self.inspectionArr.append([0 : vehicle])
            self.repairArr.removeFirst()
        } else if inspectionNum == 2 {
            /// repair braking
            print("repairing brakes...")
            self.inspectionArr.append([0 : vehicle])
            self.repairArr.removeFirst()
        } else {
            /// both
            print("reparing both...")
            self.inspectionArr.append([0 : vehicle])
            self.repairArr.removeFirst()
        }
    }
    
    mutating func doAll() {
        for vehicleTuple in inspectionArr {
            var vehicle = vehicleTuple.values.first!
            let inspectionNum = vehicleTuple.keys.first!
            self.inspect(vehicle: &vehicle, inspectionNum: inspectionNum)
        }
        while repairArr.count != 0 {
//            for vehicleTuple in inspectionArr {
//                var vehicle = vehicleTuple.values.first!
//                let inspectionNum = vehicleTuple.keys.first!
//                self.inspect(vehicle: &vehicle, inspectionNum: inspectionNum)
//            }
            
            for vehicleTuple in repairArr{
                var vehicle = vehicleTuple.values.first!
                let inspectionNum = vehicleTuple.keys.first!
                self.repair(vehicle: &vehicle, inspectionNum: inspectionNum)
            }
            
            for vehicleTuple in inspectionArr {
                var vehicle = vehicleTuple.values.first!
                let inspectionNum = vehicleTuple.keys.first!
                self.inspect(vehicle: &vehicle, inspectionNum: inspectionNum)
            }
        }
        
    }
    
    
}
