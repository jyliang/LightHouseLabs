//
//  W5D4Tests.swift
//  W5D4Tests
//
//  Created by Jason Liang on 7/27/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import XCTest
@testable import W5D4

class W5D4Tests: XCTestCase {
  
  var calculator : Calculator!
  
  override func setUp() {
    super.setUp()
    calculator = Calculator()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertFalse(1 == 2, "this is so simple, you should pass")
    
  }
  
  func testAddition() {
    let result = calculator.add(numbers: [1,1,3,4,5])
    let expectedResult = 14
    XCTAssertEqual(result, expectedResult)
    
    XCTAssertEqual(0, calculator.add(numbers:[]))
  }
  
  func testSubtraction() {
    XCTAssertEqual(100, calculator.subtract(numbers: [1000,800,100]))
    XCTAssertEqual(0, calculator.subtract(numbers: []))
  }
  
  func testMultiplication() {
    XCTAssertEqual(1, calculator.multiply(numbers: [1,1,1,1,1]))
    XCTAssertEqual(8, calculator.multiply(numbers: [2,2,2]))
    XCTAssertEqual(0, calculator.multiply(numbers: []))
  }
  
  private func somethingElse() {
    //not a test function
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      for _ in 0...100000 {
        _ = self.calculator.add(numbers: [0,1,2,3,13,12312,12,312,3,123,1231])
      }
    }
  }
  func testPerformanceExample2() {
    self.measure {
      for _ in 0...100000 {
        _ = self.calculator.add2(numbers: [0,1,2,3,13,12312,12,312,3,123,1231])
      }
    }
  }
  func testPerformanceExample3() {
    self.measure {
      for _ in 0...100000 {
        _ = self.calculator.add3(numbers: [0,1,2,3,13,12312,12,312,3,123,1231])
      }
    }
  }
  
  
  
}
