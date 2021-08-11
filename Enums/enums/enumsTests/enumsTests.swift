//
//  enumsTests.swift
//  enumsTests
//
//  Created by Luat on 8/10/21.
//

import XCTest
@testable import enums

class enumsTests: XCTestCase {
    
    func testEnumConformsToProtocol() {
        let temp = TemperatureScale.fahrenheit(100)
        let result = temp is TempConvertable
        XCTAssert(result, "\(result) should be true")
        
    }
    func testCtoF_Func() {
        if let tempC = TemperatureScale.celcius(100) as? TempConvertable {
            let expected = 212
            let result = tempC.getTempInFahrenheit()
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testKtoF_Func() {
        if let tempK = TemperatureScale.kelvin(373) as? TempConvertable {
            let expected = 212
            let result = tempK.getTempInFahrenheit()
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testCtoF_Property() {
        if let tempC = TemperatureScale.celcius(100) as? TempConvertable {
            let expected = 212
            let result = tempC.tempInFahren
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
    func testKtoF_Property() {
        if let tempK = TemperatureScale.kelvin(373) as? TempConvertable {
            let expected = 212
            let result = tempK.tempInFahren
            XCTAssertEqual(expected, result, "\(result) should equal \(expected)")
        } else {
            XCTFail()
        }
    }
    
}
