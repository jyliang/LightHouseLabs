//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var number = 4

for i in 1 ..< number * 2 {
  let isTheNumberIsWithInHalfPoint = i <= number
  var count = isTheNumberIsWithInHalfPoint ?
    i : (number * 2) - i
  print(count)
//  var result = ""
//  for _ in 0..<count {
//    result += "*"
//  }
//  print(result)
}


let numbers = [ 8, 2, 9, 1, 6, 3, 0, 4, 1, 7, 3, 5 ]

var peaks : [Int] = []

for index in 1 ... numbers.count - 1 - 1 {
  let previousNumber = numbers[index-1]
  let currentNumber = numbers[index]
  let nextNumber = numbers[index+1]
  
  let isPeak:Bool = currentNumber > previousNumber && currentNumber > nextNumber
  
  if isPeak {
    peaks.append(index)
  }
}

print(peaks)


