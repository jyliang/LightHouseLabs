//
//  W6D4Tests.swift
//  W6D4Tests
//
//  Created by Jason Liang on 7/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import XCTest
@testable import W6D4

class W6D4Tests: XCTestCase {
  
    let calculator = Calculator()
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
  
    func testAddition() {
      let sum = calculator.add(augend: 5, addend: 2)
      XCTAssertTrue(sum == (5+2), "5+2 returned \(sum)")
    }
  
  func testSubtraction() {
    let maxInt = Int.max
    let minInt = Int.min
    let result = calculator.subtract(minuend: minInt, subtrahend: maxInt)
    XCTAssertTrue(result == 0, "result for out of range in my specific implementation is: \(result)")
  }
  
  func testDivide() {
    
  }
  
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
