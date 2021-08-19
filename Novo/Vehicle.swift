//
//  Vehicle.swift
//  
//
//  Created by Bryan Lee on 8/10/21.
//

import Foundation


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
