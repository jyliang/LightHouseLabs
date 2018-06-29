//
//  Dog.swift
//  W4D4
//
//  Created by Jason Liang on 6/28/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
  @objc dynamic var name = ""
  @objc dynamic var age = 0
}
