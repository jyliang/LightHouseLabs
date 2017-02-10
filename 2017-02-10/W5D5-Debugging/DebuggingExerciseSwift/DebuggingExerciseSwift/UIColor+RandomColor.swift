//
//  UIColor+RandomColor.swift
//  DebuggingExerciseSwift
//
//  Created by steve on 2016-04-14.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor()-> UIColor {
        return UIColor(red: (CGFloat(arc4random()%256)/256.0), green: CGFloat(arc4random()%256)/256.0, blue: CGFloat(arc4random()%256)/256.0, alpha: 1.0)
    }
}
