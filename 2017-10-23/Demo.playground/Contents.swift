//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func fizzBuzz(maxBound : Int)
{
  for index in 1...maxBound
  {
    var string = ""
    if (index % 3 == 0)
    {
      string.append("fizz")
    }
    if (index % 5 == 0)
    {
      string.append("buzz")
    }
    if (string.characters.count == 0)
    {
      string.append("\(index)")
    }
    print(string)
  }
}

fizzBuzz(maxBound: 15)

let arrayOfCGRect = [
  CGRect(x: 100, y: 100, width: 100, height: 100),
  CGRect(x: 100, y: 100, width: 200, height: 200),
  CGRect(x: 0, y : 0, width:100, height:100),
  CGRect(x: -100, y : -100, width:100, height:100)]

func getSmallestEnclosingRect(rects : [CGRect]) -> CGRect {
  var left : CGFloat = CGFloat.infinity //minimize <--
  var right : CGFloat = 0 // -->
  var bottom : CGFloat = 0 // v
  var top : CGFloat = 0 // ^
  
  if (rects.count == 0) {
    return CGRect.zero
  }
  
  for rect in rects
  {
    left = min(rect.origin.x, left)
    right = max(rect.origin.x + rect.size.width, right)
    top = min(rect.origin.y, top)
    bottom = max(rect.origin.y + rect.size.height, bottom)
  }
  let rect = CGRect(x: left, y: top, width: right - left, height: bottom - top)
  return rect
}

print(getSmallestEnclosingRect(rects: arrayOfCGRect))





