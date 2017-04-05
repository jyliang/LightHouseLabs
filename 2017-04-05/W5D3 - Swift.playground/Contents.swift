//: Playground - noun: a place where people can play

import UIKit

let number = 4

var result = ""

result = result.appending("*")
result = result.appending("*")
result = result.appending("*")

let index = result.index(result.startIndex, offsetBy: result.characters.count - 1)
result.substring(to: index)  // Hello

//result = result.substring(to: <#T##String.Index#>)

print("\(result)")

for index in 1...number {
  
  for index2 in 1...number {
      print("\(index) \(index2)")
  }
  
}


//for (Int index = 0; index < number; index++)
