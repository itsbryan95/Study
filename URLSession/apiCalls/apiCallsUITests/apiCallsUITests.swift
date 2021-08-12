//
//  apiCallsUITests.swift
//  apiCallsUITests
//
//  Created by Luat on 8/12/21.
//

import XCTest
@testable import apiCalls

class apiCallsUITests: XCTestCase {

    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testJokesButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Jokes"].tap()
        sleep(1)
        let textField = app.staticTexts["FirstLabel"]
        let jokeStr = textField.label
        XCTAssertTrue(jokeStr.contains("Chuck Norris"), "\(jokeStr) should contain Chuck Norris")
    }
    
    func testDrinksButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Drinks"].tap()
        sleep(1)
        let textField = app.staticTexts["FirstLabel"]
        let jokeStr = textField.label
        XCTAssert(jokeStr.contains("Long Island"))
    }
    
    func testShowsButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["TV Shows"].tap()
        sleep(1)
        let textField = app.staticTexts["FirstLabel"]
        let showStr = textField.label
        XCTAssert(showStr.contains("Monica Gets a Roommate"))
    }
    func testMusicButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Music"].tap()
        sleep(1)
        let textField = app.staticTexts["FirstLabel"]
        let jokeStr = textField.label
        XCTAssert(jokeStr.contains("Dan"))
    }
    

}
