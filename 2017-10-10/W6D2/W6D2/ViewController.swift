//
//  ViewController.swift
//  W6D2
//
//  Created by Jason Liang on 10/10/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var greyBov: UIView!
  @IBOutlet weak var greyBoxWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak var greyBoxTopConstraint: NSLayoutConstraint!
  @IBOutlet var boxView: UIView!
  let anotherView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    anotherView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    anotherView.backgroundColor = UIColor.lightGray
  }
  
  @IBAction func transitionButtonTapped(_ sender: Any) {
    let transitionOptions = UIViewAnimationOptions.transitionCrossDissolve
    
    if (boxView.superview != nil) {
    UIView.transition(from: boxView, to: anotherView, duration: 1, options: transitionOptions, completion: nil)
    } else {
    UIView.transition(from: anotherView, to: boxView, duration: 1, options: transitionOptions, completion: nil)
    }

    
  }
  
  @IBAction func fadeButtonTapped(_ sender: Any) {
    self.greyBoxTopConstraint.constant = 0
    self.greyBoxWidthConstraint.constant = 200
    UIView.animate(withDuration: 1) {
      self.view.layoutIfNeeded()
    }
    
    //keyframe
    /*
    UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
        self.boxView.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.8, animations: {
        self.boxView.frame = CGRect(x: 100, y: 500, width: 100, height: 100)
      })
      
      self.boxView.backgroundColor = UIColor.green
      
    }, completion: nil)
 */
    
    //spring
    /*
    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: {
      self.boxView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
      //self.boxView.layer.transform -- 3d
      //self.boxView.transform -- 2d
      
      self.boxView.transform = CGAffineTransform(rotationAngle: 1)
      
      //self.boxView.transform = CGAffineTransform(scaleX: 2, y: 2)
      self.boxView.backgroundColor = .red
    }, completion: nil)
 */
    
    //options
    /*
    UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
      //self.boxView.alpha = 0
      self.boxView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
      //self.boxView.layer.transform -- 3d
      //self.boxView.transform -- 2d
      
      self.boxView.transform = CGAffineTransform(rotationAngle: 1)
      
      //self.boxView.transform = CGAffineTransform(scaleX: 2, y: 2)
      self.boxView.backgroundColor = .red
    }, completion: nil)
     */
    
    /*
    //simple
    UIView.animate(withDuration: 1) { 
      //self.boxView.alpha = 0
      self.boxView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
      //self.boxView.layer.transform -- 3d
      //self.boxView.transform -- 2d
      
      self.boxView.transform = CGAffineTransform(rotationAngle: 1)

      //self.boxView.transform = CGAffineTransform(scaleX: 2, y: 2)
      self.boxView.backgroundColor = .red
      
    }
     */
  }

  @IBAction func showButtonTapped(_ sender: Any) {
    self.greyBoxTopConstraint.constant = 380
    self.greyBoxWidthConstraint.constant = 100
    UIView.animate(withDuration: 1) {
      self.view.layoutIfNeeded()
      
    }
    /*
    self.greyBov.layoutIfNeeded()
    UIView.animate(withDuration: 1) {
      //self.boxView.alpha = 1
      self.boxView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
    self.boxView.transform = CGAffineTransform(rotationAngle: 0)
      //self.boxView.transform = CGAffineTransform(scaleX: 1, y: 1)
      self.boxView.backgroundColor = .purple
    }*/
  }

}

