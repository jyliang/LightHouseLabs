//
//  Calculator.swift
//  w5d4-demo
//
//  Created by Roland on 2017-10-31.
//  Copyright © 2017 Roland. All rights reserved.
//

import Foundation

public class Calculator {
  
  func add(augend: Int, addend: Int) -> Int {
    let sum = augend + addend
    return sum
  }
  
  func subtract(minuend: Int, subtrahend: Int) -> Int {
    if (minuend < Int.min / 2 || subtrahend > Int.max / 2) {
      return 0
    }
    do {
      let difference = minuend - subtrahend
      return difference
    } catch {
      return 0
    }
  }
  
  func multiply(multiplicand: Int, multiplier: Int) -> Int {
    let product = multiplicand * multiplier
    return product
  }
  
  func divide(dividend: Int, divisor: Int) -> (quotient: Int, remainder: Int)? {
    guard divisor != 0 else {
      return nil
    }
    let quotient = dividend / divisor
    let remainder = dividend - (quotient * divisor)
    return (quotient: quotient, remainder: remainder)
  }
}
