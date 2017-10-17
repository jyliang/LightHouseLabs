//
//  ViewController.swift
//  W7D2
//
//  Created by Jason Liang on 10/17/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    //(previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.compact)
  }

}

