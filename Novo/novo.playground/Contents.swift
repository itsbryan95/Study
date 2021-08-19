import UIKit

var greeting = "Hello, playground"


protocol VehicleProtocol {
    var id : Int { get }
    var makeModel: String { get }
    var isComplete: Bool { get set }
}


struct Vehicle: VehicleProtocol {
    var id : Int
    var makeModel: String
    var isComplete: Bool = false
}

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
        print(self)
    }
}


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

var bob = Customer(name: "bob")

var laFerarri = Vehicle(id: 1, makeModel: "Ferarri/LaFerrari")
var cyberTruck = Vehicle(id: 2, makeModel: "Tesla/CyberTruck")

bob.vehicle = laFerarri
var mechanic = Mechanic()

bob.giveCarToMechanic(vehicle: bob.vehicle!, inspectionNum: 3, mechanic: &mechanic)


//mechanic.addToInsepctionQueue(vehicle: laFerarri, inspectionNum: 1)
mechanic.addToInsepctionQueue(vehicle: cyberTruck, inspectionNum: 0)

mechanic.doAll()
