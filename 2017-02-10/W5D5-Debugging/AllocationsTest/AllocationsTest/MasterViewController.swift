//
//  MasterViewController.swift
//  AllocationsTest
//
//  Created by steve on 2016-05-28.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
  
  @IBOutlet weak var detailButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.detailButton.setTitleColor(UIColor.randomColor(), for: UIControlState())
    self.view.backgroundColor = UIColor.randomColor()
  }
  
  
  @IBAction func unwind(_ sender:UIStoryboardSegue) {
    
  }
  
  
}
