//
//  ViewController.swift
//  W5D2
//
//  Created by Jason Liang on 10/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import W5D2Core

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let card = Card()
    card.openFunction()
    card.publicFunction()
    card.internalFunction() // default
    
    let core = Core()
    core.openFunction()
    core.publicFunction()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

