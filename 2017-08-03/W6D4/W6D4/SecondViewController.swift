//
//  SecondViewController.swift
//  W6D4
//
//  Created by Jason Liang on 8/3/17.
//  Copyright © 2017 Jason. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
  @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
  @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func switchConstraint(_ sender: Any) {
    
    let centerActive = !centerYConstraint.isActive
    
    centerXConstraint.isActive = centerActive
    centerYConstraint.isActive = centerActive
    
    trailingConstraint.isActive = !centerActive
    bottomConstraint.isActive = !centerActive
    
    
    //self.view.layoutIfNeeded()
    UIView.animate(
      withDuration: 1.0,
      delay: 0,
      usingSpringWithDamping: 0.1,
      initialSpringVelocity: 10,
      options: UIViewAnimationOptions.curveEaseInOut,
      animations: {
        self.view.layoutIfNeeded()
    },
      completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

