//
//  Cat.swift
//  W5D1
//
//  Created by Jason Liang on 11/27/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class Cat: NSObject {
  
  var nonOptional:Int = 1
  var optional:Int? = nil
  
  
  func test() {
    nonOptional = 2 //ok
//    nonOptional = nil // not ok
    optional = 1
    optional = nil
//    let vc:ViewController? = nil
    
    var person:Person? = nil
    person = Person(name: "Jason", address: nil)
    
  }
  
}
