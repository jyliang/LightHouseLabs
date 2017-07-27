//
//  Calculator.swift
//  W5D4
//
//  Created by Jason Liang on 7/27/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import Foundation

struct Calculator {
  
  func add(numbers: [Int]) -> Int {
    //    var result = 0
    //    numbers.forEach { (value) in
    //      result = value + result
    //    }
    //    return result
    
    //    return numbers.reduce(0) { (result, currentNumber) -> Int in
    //      return result + currentNumber
    //    }
    
    return numbers.reduce(0, +)
  }
  
  
  func add2(numbers: [Int]) -> Int {
    var result = 0
    numbers.forEach { (value) in
      result = value + result
    }
    return result
  }
  
  
  func add3(numbers: [Int]) -> Int {
    return numbers.reduce(0) { (result, currentNumber) -> Int in
      return result + currentNumber
    }
  }
  
  func subtract(numbers:[Int]) -> Int {
    if numbers.count == 0 {
      return 0
    }
    return numbers.reduce(0, -) + numbers[0] * 2
  }
  
  func multiply(numbers:[Int]) -> Int {
    if numbers.count == 0 {
      return 0
    }
    return numbers.reduce(1, *)
  }
}
