//
//  W6D4UITests.swift
//  W6D4UITests
//
//  Created by Jason Liang on 5/17/18.
//

import XCTest

class W6D4UITests: XCTestCase {
        
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
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      
      let app = XCUIApplication()
      let backButton = app.navigationBars.buttons["Back"]
      app.buttons["Test 1"].tap()
      
      let button = XCUIApplication().buttons["someButton"]
      
//      let frame = button.frame
//      let xPosition = frame.origin.x
//      let yPosition = frame.origin.y
      
      XCTAssert(button.exists)
      
      backButton.tap()
      
      
      
      let app = XCUIApplication()
      let test1Button = app.buttons["Test 1"]
      test1Button.tap()
      
      let backButton = app.navigationBars["UIView"].buttons["Back"]
      backButton.tap()
      
      
      test1Button.tap()
      
      let element = app.otherElements.containing(.navigationBar, identifier:"UIView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
      element.tap()
      element.swipeRight()
      
      backButton.tap()
      
      
    }
    
}
