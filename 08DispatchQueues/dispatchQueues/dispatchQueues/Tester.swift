//
//  Tester.swift
//  dispatchQueues
//
//  Created by Luat on 8/11/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    var printedString: String = ""
    var sequentialPrints: [String] = []
    func resetPrints() {
        printedString = ""
        sequentialPrints = []
    }
}

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    DispatchQueue.main.async {
        let output = items.map { "\($0)" }.joined(separator: separator)
        Swift.print(output, terminator: terminator)
        Tester.shared.printedString = output
        Tester.shared.sequentialPrints.append(output)
    }
}
