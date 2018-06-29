//
//  FirstViewController.swift
//  W4D4
//
//  Created by Jason Liang on 6/28/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons

class FirstViewController: UIViewController {
  
  let floatingButton = MDCButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    floatingButton.frame = CGRect(x: 100, y: 100, width: 200, height: 60);
    floatingButton.setElevation(.dialog, for: .normal)
    floatingButton.setElevation(.cardPickedUp, for: .highlighted)
    view.addSubview(floatingButton)
  }

}

