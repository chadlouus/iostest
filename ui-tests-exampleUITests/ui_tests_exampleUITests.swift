//
//  ui_tests_exampleUITests.swift
//  ui-tests-exampleUITests
//
//  Created by Jakub Knejzlik on 22/03/16.
//  Copyright © 2016 Funtasty Digital. All rights reserved.
//

import XCTest

class ui_tests_exampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExistance() {

        
        let app = XCUIApplication()
        app.tables.staticTexts["Testing if element exists"].tap()
        
        let label = app.staticTexts["Hello world"]
        XCTAssertFalse(label.exists)
        
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: label, handler: nil)
        
        app.buttons["Show the label"].tap()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(label.exists)
        
        app.navigationBars["ui_tests_example.ExistanceTestView"].buttons["Root View Controller"].tap()
        
    }
    
    func testEllipseExistance() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Testing if text with an ellipse exists"].tap()
        
        let label = app.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
        XCTAssert(label.exists)
        
        app.navigationBars["UIView"].buttons["Root View Controller"].tap()
        
    }
    
    func testAppearance() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Waiting for an element to appear"].tap()

        let button = app.buttons["Hello world!"]
        XCTAssertFalse(button.exists)
        
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: button, handler: nil)
        
        waitForExpectations(timeout: 6, handler: nil)
        XCTAssert(button.exists)

        
        app.navigationBars["ui_tests_example.AppearanceTestView"].buttons["Root View Controller"].tap()
        
    }
    
    func testInteractions() {
        
        let app = XCUIApplication()

        app.tables.staticTexts["Interactions"].tap()

        let typeTextHereTextField = app.textFields["type text here"]
        typeTextHereTextField.tap()
        typeTextHereTextField.typeText("hello world, this is test")

        app.sliders.element.adjust(toNormalizedSliderPosition: 1)
        app.sliders.element.adjust(toNormalizedSliderPosition: 0.5)
        
        let app2 = app
        app2.buttons["A"].tap()
        app2.buttons["B"].tap()
        app2.buttons["C"].tap()
        
        // watchout for localization!
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "June")
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "13")
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "1990")
        app.navigationBars["UIView"].buttons["Root View Controller"].tap()
        
    }
    
}
