//
//  CustomPrint.swift
//  Day1-BasicTypes
//
//  Created by Luat on 5/16/21.
//

import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let output = items.map { "\($0)" }.joined(separator: separator)
    Swift.print(output, terminator: terminator)
    Tester.shared.printedString = output
    Tester.shared.sequentialPrints.append(output)
}
