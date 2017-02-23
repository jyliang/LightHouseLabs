//
//  SecondViewController.swift
//  SteviaExample
//
//  Created by Jason Liang on 2/23/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  let baseView = SecondView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.sv(baseView)
    baseView.fillContainer()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

