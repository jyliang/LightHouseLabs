//
//  BreakPointsTourSwiftTests.swift
//  BreakPointsTourSwiftTests
//
//  Created by steve on 2016-05-30.
//  Copyright © 2016 steve. All rights reserved.
//

import XCTest
@testable import BreakPointsTourSwift

class BreakPointsTourSwiftTests: XCTestCase {
    
    let flag = true
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Talk through debug controls by stepping through this code
    // Moving breakpoints (Live)
    // Moving current break line
    // Dynamically adding breakpoints
    // Breakpoint navigator
    
    func testDemoDebugControls() {
        
        var num = 10
        num += 10
        let result = self.functionToStepInto(num)
        print(result)
    }
    
    // stepping into a function
    func functionToStepInto(_ num:Int)->Int {
        var num = num
        num = num + 100
        return num
    }
    
    func testConditionSetting() {
        for i in 1...5 {
          print(#line, i)
        }
    }
    
    func testIgnoreTimesSetting() {
        for i in 1...5 {
          print(#line, i)
        }
    }
    
    func testActionDebuggerCommand() {
        for i in 1...5 {
          print(#line, i)
        }
    }
    
    
    func testActionLogMesageWithExpressionLoggedToConsole() {
        for i in 1...5 {
          print(#line, i)
        }
    }
    
    func testActionMesageWithExpressionSpeaking() {
        for i in 1...5 {
            print(i)
        }
    }
    
    func testActionSound() {
        for i in 1...5 {
            print(i)
        }
    }
    
    func testMultipleActions() {
        for i in 1...5 {
            print(i)
        }
    }
    
    func testTestFailureBreakPoint() {
        // setting TEST FAILURE breakpoint in breakpoint navigator makes tests break on failure
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nav = sb.instantiateInitialViewController() as! UINavigationController
        let vc = nav.topViewController as! ViewController
        // forces views to load
        XCTAssertNotNil(nav.view)
        XCTAssertNotNil(vc.view)
        XCTAssertNotNil(vc.goButton)
        let sut = vc.num
        XCTAssertTrue(sut == 11)
    }
    
    // Show SYMBOLS breakpoint in navigator
  
    // Show ALL EXCEPTIONS breakpoint by tapping Go button in ViewController
  
}
