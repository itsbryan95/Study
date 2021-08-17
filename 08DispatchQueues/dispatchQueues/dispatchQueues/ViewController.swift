//
//  ViewController.swift
//  dispatchQueues
//
//  Created by Luat on 8/11/21.
//

import UIKit

class ViewController: UIViewController {

    let numEnd = 300
    
    let task: (Int) -> Void = { num in
        print("from closure \(num)")
    }
    
    let shortTask: (DispatchGroup?) -> Void = { _ in
        print("start of SHORT task")
        sleep(1)
        print("end of SHORT task")
    }
    
    let longTask: (DispatchGroup?) -> Void = { _ in
        print("start of LONG task")
        sleep(2)
        print("end of LONG task")
    }
    
    let shortTaskGroup: (DispatchGroup?) -> Void = { group in
        print("start of SHORT task")
        sleep(1)
        print("end of SHORT task")
        group?.leave()
    }
    
    let longTaskGroup: (DispatchGroup?) -> Void = { group in
        print("start of LONG task")
        sleep(2)
        print("end of LONG task")
        group?.leave()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let queueManager = QueueManager()
        
/// Complete test cases first, then do problems
        ///
/// Problem 1: Uncomment and run. Take screenshot of prints.
//        queueManager.serialClosures(task: task, numTimes: 5)

/// Problem 2:
//        queueManager.concurrentClosures(task: task, numTimes: 5)


/// Problem 3:
//        print("Executing in SERIAL. Long task first:")
//        queueManager.execute(closure: longTask, queueType: .serial)
//        queueManager.execute(closure: shortTask, queueType: .serial)
//        queueManager.execute(closure: { _ in print("SERIAL end") }, queueType: .serial)


/// Problem 4:
//        print("Executing in CONCURRENT. Long task first:")
//        queueManager.execute(closure: longTaskGroup, queueType: .concurrent)
//        queueManager.execute(closure: shortTaskGroup, queueType: .concurrent)
//        queueManager.addGroupCompletion()

    }

}

