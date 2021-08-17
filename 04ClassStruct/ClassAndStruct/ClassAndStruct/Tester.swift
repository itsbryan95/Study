//
//  Tester.swift
//  ClassAndStruct
//
//  Created by Luat on 8/5/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    var printedString: String = ""
    var sequentialPrints: [String] = []
}

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let output = items.map { "\($0)" }.joined(separator: separator)
    Swift.print(output, terminator: terminator)
    Tester.shared.printedString = output
    Tester.shared.sequentialPrints.append(output)
}
