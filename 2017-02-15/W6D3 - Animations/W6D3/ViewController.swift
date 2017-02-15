//
//  ViewController.swift
//  W6D3
//
//  Created by Jason Liang on 2/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let newLayer = CALayer()
    newLayer.frame = CGRect(x: 30, y: 30, width: 100, height: 100)
    newLayer.backgroundColor = UIColor.red.cgColor
    view.layer.addSublayer(newLayer)
    
    // Uncomment each section to observe the visual effects
    
    
    // MARK: 1 Simple alpha
    /*
    let opacityAnim = CABasicAnimation(keyPath: "opacity")
    opacityAnim.fromValue = 1
    opacityAnim.toValue = 0
    opacityAnim.duration = 2.0
    opacityAnim.repeatCount = HUGE
    newLayer.add(opacityAnim, forKey: "opacityAnim")
     */
    
    
      // MARK: 2 Simple width that reverses
    /*
        let widthAnim = CABasicAnimation(keyPath: "bounds.size.width")
        widthAnim.fromValue = 100
        widthAnim.toValue = 200
        widthAnim.duration = 3.0
        widthAnim.autoreverses = true // goes back and forth
        widthAnim.repeatCount = HUGE
        newLayer.add(widthAnim, forKey: "widthAnimation")
     */
    
    
    // MARK: 3 delegate to observe start/stop events
    
    /*
      let cornerAnim = CABasicAnimation(keyPath: "cornerRadius")
      cornerAnim.fromValue = 0
      cornerAnim.toValue = 20
      cornerAnim.duration = 2.0
      cornerAnim.speed = 10
      cornerAnim.repeatCount = 2
      cornerAnim.autoreverses = true
      cornerAnim.delegate = self // NOTE: the delegate invokes start/stop methods, check the console output
      newLayer.add(cornerAnim, forKey: "cornerRadiusAnimation")
     */
    
    // MARK: 4 keyframe, matching values/keyTimes to customize position
    /*
      let keyframeYAnim = CAKeyframeAnimation(keyPath: "position.y")
      keyframeYAnim.values = [30, 450, 20, 300, 50]
      keyframeYAnim.keyTimes = [0, 0.1, 0.5, 0.6, 1]
      keyframeYAnim.duration = 4.0
      keyframeYAnim.repeatCount = HUGE
      newLayer.add(keyframeYAnim, forKey: "yAnimation")
     */
    
    
    // MARK: 5 allow the layer position to follow a path
    /*
        let path = CGPath(ellipseIn: CGRect(origin: view.center, size: CGSize(width: 100, height: 400)), transform: nil)
        let keyframePathAnim = CAKeyframeAnimation(keyPath: "position")
        keyframePathAnim.path = path
        keyframePathAnim.duration = 4.0
        keyframePathAnim.repeatCount = HUGE
//        keyframePathAnim.rotationMode = kCAAnimationRotateAuto // uncomment this to see the effect of rotationMode
        newLayer.add(keyframePathAnim, forKey: "movingAnim")
    
    */

    // MARK: 6 You can animate color changes as well
    /*
        let colorAnim = CAKeyframeAnimation(keyPath: "backgroundColor")
        colorAnim.values = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        colorAnim.duration = 2.0
        colorAnim.repeatCount = HUGE
        newLayer.add(colorAnim, forKey: "colorChanging")
     */
    
    // MARK: 7 Group animations together
/*
     // Also uncomment colorAnim and conerAnim
     // Note if you extend the animation duration of color Anim and cornerAnim, the duration is cut short because of the group animation override.
     
      let grp = CAAnimationGroup()
      grp.animations = [colorAnim, cornerAnim]
      grp.duration = 1
      newLayer.add(grp, forKey: nil)
*/
    
    // MARK: 8 control the speed of all your animations in the layer
//    newLayer.speed = 0.5
    
    
    // MARK: BONUS material 1:
    
    /*
     model and presentation of the layer is different. the presentation layer can tell you at the time of call the exact value of what's on screen. create a button to print the values below while you are animating the cornerradius.
     
    newLayer.model().cornerRadius
    newLayer.presentation()?.cornerRadius
    */
    //
    
    // MARK: BONUS material 2:
    
    /*
     You can stop animations with these 2 methods:
     (the animation key is used in this case to track down the exact animation)
     
     newLayer.removeAllAnimations()
     newLayer.removeAnimation(forKey: "colorChanging")
     print("All animation keys: \(newLayer.animationKeys())"
     */
    
  }


}


// MARK: 3
extension ViewController : CAAnimationDelegate {
  func animationDidStart(_ anim: CAAnimation) {
    print("animation did start")
  }
  
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    print("animation did stop")
  }
}

