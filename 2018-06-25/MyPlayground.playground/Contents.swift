//: Playground - noun: a place where people can play

import UIKit

var str : String?

str = nil

str = "Hello, playground"

str = "hello"

print(str)

let number = 1

print("\(str) \(number)")

var array : [String] = ["1", "str"]

array.append("another string")


var salaries : [String:Float] = ["Joe": 50000, "Jane": 65000.12]

if salaries.count > 1 {
  print("\(salaries.count)")
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
  let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
  let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
  let vegetableComment = "Is it a spicy \(x)?"
default:
  let vegetableComment = "Everything tastes good in soup."
}

var optionalValue : String? = "abc"

if var value = optionalValue {
  print("\(value)")
  value = "another value"
}

if optionalValue != nil {
  print("\(optionalValue!)")
}

let interestingNumbers =
  ["Prime": [2, 3, 5, 7, 11, 13],
   "Fibonacci": [1, 1, 2, 3, 5, 8],
   "Square": [1, 4, 9, 16, 25]
]
var largest = 0

//(String, [Int])
for (key, value) in interestingNumbers {
  print("\(key)")
  print("\(value)")
  for number in value {
    print("\(number)")
  }
}

for item in interestingNumbers {
  print("\(item.key)")
}

var tupleItem : (Int, Int, String)
tupleItem.0 = 1
tupleItem.1 = 2
tupleItem.2 = "String value"

for i in 0..<5 {
  // do something 5 times
  print(i)
}

for i in 0...5 {
  print(i)
}

func aFunction(value:String) -> String {
  print("running aFunction - \(value)")
  return "\(value) modified"
}

let modified = aFunction(value:"a beautiful string")
print(modified)
//aFunction("a beautiful string")


let numbers = [10, 7, 28, 9, 83, 73, 65, 2, 39]

let mappingFunc = { (number) -> Int in
  return number * number
}

numbers.map(mappingFunc)

numbers.map { (number) -> Int in
  return number
}

numbers.map{ number in number * number}

numbers.reduce(0) { (result, number) -> Int in
  return result + number
}

class Shape {
  
  var foo: Int {
//    get { return getFoo() }
//    set { setFoo(newValue) }
    willSet {
      print("will Set \(foo)")
    }
    didSet {
      print("did Set \(foo)")
    }
  }
  
  var numberOfSides = 0
  
  init(defaultSideCount : Int) {
    numberOfSides = defaultSideCount
    foo = 1
  }
  
  func description() -> String {
    return "A shape with \(numberOfSides) sides."
  }
  
//  mutating func increaseSideCount() {
//    numberOfSides = numberOfSides + 1
//  }
}
var newShape = Shape(defaultSideCount: 10)
newShape.numberOfSides = 5
//newShape.increaseSideCount()

newShape.foo = 1





