//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var gravity : Float? = 3.711



//Optional binding (if let unwrapped = optional {...} else {...}) lets us use unwrapped values in the scope of the if statement

if let gravity = gravity {
    print("there's gravity!")
    print(gravity)
} else {
    print("there's no gravity!")
    gravity = 3.7
    //gravity2 = 3.7
    print(gravity)
    
}
print(gravity)

//Optional chaining (optional?.someMethod() or optional?.someProperty) returns an optional

class Planet {
  var gravity : Float?
  var dayLength : Float?
}

struct PlanetStruct {
  var gravity : Float?
  var dayLength : Float?
  
  //guard (condition) else {...} These only work inside functions and their purpose is to let us exit early if the conditions are not what we expect. The else statement must return or throw. They can be combined with optional bindings with guard let unwrapped = optional else {...}, which lets us use our unwrapped values for the scope of the whole method.
  
  func printPlanetInfo() {
    guard let gravity = gravity,
      let dayLength = dayLength else {
      print("no gravity or no dayLength found")
      return
    }
    
    print("gravity is \(gravity)m/s2 and day length is \(dayLength) seconds")
  }
  
}
var planet : PlanetStruct?
let earth = PlanetStruct(gravity: 9.8, dayLength: 86400)
let mars = PlanetStruct(gravity: nil, dayLength: 88800)

class Earth : Planet {
  
}

let earth1 = Earth()
var planetObj : Planet?
planetObj = earth1

if let earth = planetObj as? Earth {
  earth.gravity = 9.8
}

let earthObj = planetObj as! Earth




print("<<<<<<<<<")
earth.printPlanetInfo()
print("<<<<<<<<<")

planet = earth

if let gravity = planet?.gravity,
  let dayLength = planet?.dayLength {
  print("gravity is \(gravity)m/s2 and day length is \(dayLength) seconds")
} else {
  print("no gravity or no dayLength found")
}

//Force-unwrapping (optional!.someMethod() or optional!.someProperty) treats the optional as its unwrapped value; crashes if it's nil

// Jason dislike this very much:
planet = earth
print("gravity is \(planet!.gravity!)m/s2 and day length is \(planet!.dayLength!) seconds")







print("it's a beautiful day~")












