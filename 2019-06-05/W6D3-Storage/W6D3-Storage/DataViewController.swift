//
//  DataViewController.swift
//  W6D3-Storage
//
//  Created by Jason Liang on 2019-06-05.
//  Copyright © 2019 jasonliang. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

  @IBOutlet weak var dataLabel: UILabel!
  var dataObject: String = ""


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.dataLabel!.text = dataObject
  }


}

