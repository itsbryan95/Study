//
//  QueueManager.swift
//  dispatchQueues
//
//  Created by Luat on 8/11/21.
//

import Foundation

class QueueManager {
/**
1. Pass the test cases
2. Finish the rest of the functions
 - To test: make sure you have the same prints as the screenshots
*/

/// See test cases: print 0 to end serially
    func printSerial(to end: Int) {
        for num in 0...end {
            /// Your code here
        }
    }
    
/// See test cases
    func printConcurrent(to end: Int) {
        for num in 0...end {
            /// Your code here
        }
    }
    
/// See screenshots: Problem 1
    func serialClosures(task: @escaping (Int) -> Void, numTimes: Int) {
        for num in 0...numTimes {
        /// Your code here
        }
    }
    
/// See screenshots: Problem 2
    func concurrentClosures(task: @escaping (Int) -> Void, numTimes: Int) {
        for num in 0...numTimes {
        /// Your code here
        }
    }

/// See screenshots: Problem 3 and 4
    func execute(closure: @escaping (DispatchGroup?) -> Void, queueType: QueueType) {
        
    }
    
///  See screenshots: Problem 3 and 4, print GROUP end only after both tasks are done
    func addGroupCompletion() {
        
    }
    
}

enum QueueType {
    case serial
    case concurrent
}
