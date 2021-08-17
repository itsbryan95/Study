//
//  dispatchQueuesTests.swift
//  dispatchQueuesTests
//
//  Created by Luat on 8/11/21.
//

import XCTest
@testable import dispatchQueues

class dispatchQueuesTests: XCTestCase {
    
    let qM = QMMock()
    let testingSerialQ = DispatchQueue(label: "testing")
    
    func testHasSerialQ() {
        XCTAssertNotNil(qM.serialQueue)
        let serialLabel = qM.serialQueue?.label
        XCTAssertNotNil(serialLabel)
    }
    
    func testHasConcurrentQ() {
        XCTAssertNotNil(qM.concurrentQueue)
        let concurrentLabel = qM.concurrentQueue?.label
        XCTAssertNotNil(concurrentLabel)
    }
    
    func testHasGroup() {
        let group = qM.group
        XCTAssertNotNil(group)
    }
    
    func testPrintASerial() {
        Tester.shared.resetPrints()
        var first = "", last = ""
        let expect = expectation(description: "waiting")
        self.qM.printSerial(to: 1000)
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
        let results = Tester.shared.sequentialPrints
        first = results.first ?? "none"
        last = results.last ?? "none"
        XCTAssertEqual(first, "0")
        XCTAssertEqual(results.count, 1001)
        XCTAssertEqual(last, "1000")
    }
    
    func testPrintConcurrent() {
        Tester.shared.resetPrints()
        var first = "", last = ""
        let expect = expectation(description: "waiting")
        self.qM.printConcurrent(to: 1000)
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
        let results = Tester.shared.sequentialPrints
        first = results.first ?? "none"
        last = results.last ?? "none"
        XCTAssertEqual(first, "0")
        XCTAssertEqual(results.count, 1001)
        XCTAssertNotEqual(last, "1000")
    }

    func testCreateQueue() {
        let queue = qM.createQueue(qos: .background, type: .concurrent)
        let qos = queue?.qos
        
        XCTAssertNotNil(queue)
        
        XCTAssertEqual(qos, .background)
        
    }
}

class QMMock: QueueManager, QMVariables {}
protocol QMVariables {}
extension QMVariables {
    var serialQueue: DispatchQueue? {
        nil
    }
    var concurrentQueue: DispatchQueue? {
        nil
    }
    var group: DispatchGroup? {
        nil
    }
    
    func printSerial(to end: Int) {}
    
    func printConcurrent(to end: Int) {}
    
    func createQueue(qos: DispatchQoS, type: DispatchQueue.Attributes) -> DispatchQueue? {
        return nil
    }
}
