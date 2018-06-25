//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//- Create a class for Car. Add a String property called model.
class Car {
  var model : String

  //option2:
//  init() {
//    model = ""
//  }
  
  //- Create a custom initalizer that requires an String model as an input.
  init(model:String) {
    self.model = model
  }
  
  //- Create a function called drive. Inside the function include a print statement that prints the model of the car you are driving.
  func drive() {
    print(model)
  }
}

//- Subclass Car and make a Toyota Class. Override init() and set the model to "Prius" inside the method.
class Toyota : Car {
  // option2:
//  override init() {
//    super.init()
//    self.model = "Prius"
//  }
  init() {
    super.init(model: "Prius")
  }
}

//- Add an instance of a Car called nissan. Initialize it with model named "Rogue"
let nissan = Car(model: "Rogue")

//- Add the drive() method to make sure it prints out "Rogue"
nissan.drive()

//- Add an instance of Toyota called toyota. Initialize it.
let toyota = Toyota()

//- Add the drive() method to make sure it prints out "Prius"
Toyota().drive()
