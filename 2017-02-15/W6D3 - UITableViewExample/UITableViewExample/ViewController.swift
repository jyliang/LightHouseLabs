//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Jason Liang on 2/15/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    imageView.sd_setImage(with: URL(string: "http://lorempixel.com/400/300/"), placeholderImage: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

