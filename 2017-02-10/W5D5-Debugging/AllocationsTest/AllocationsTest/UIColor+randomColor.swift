//
//  UIColor+randomColor.swift
//  AllocationsTest
//
//  Created by steve on 2016-05-28.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

extension UIColor {
  static func randomColor() -> UIColor {
    func randomNum()-> CGFloat {
      let num = CGFloat(arc4random()%256)
      return num/CGFloat(256.0)
    }
    return UIColor(red: randomNum(), green: randomNum(), blue: randomNum(), alpha: 1.0)
  }
}
