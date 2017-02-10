//
//  DetailViewController.swift
//  AllocationsTest
//
//  Created by steve on 2016-05-28.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var masterButton: UIButton!
  
  typealias Block = () -> Void
  
  var closure: Block?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupRandomColors()
  }
  
  func setupRandomColors() {
    self.masterButton.setTitleColor(UIColor.randomColor(), for: UIControlState())
    self.view.backgroundColor = UIColor.randomColor()
  }
  
  @IBAction func buttonTapped() {
    closure = {
      print("Some fake stuff")
      self.fakeFunk()
    }
    closure?()
  }
  
  //    @IBAction func buttonTapped() {
  //        closure = { [weak self] in
  //            print("Some fake stuff")
  //            guard let weakSelf = self else {
  //                return
  //            }
  //            weakSelf.fakeFunk()
  //        }
  //        closure?()
  //    }
  
  
  
  func fakeFunk() {
    print("fake funk")
  }
  
  
}
