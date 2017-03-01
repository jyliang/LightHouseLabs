//
//  ViewController.swift
//  W8D3Demo
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import W8D3DemoKit

class ViewController: UIViewController {

  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var textField: UITextField!
  
  let manager = DemoKitManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let container = DemoHelper.sharedInstance.persistentContainer
    print("container \(container)")
  }
  
  func refresh() {
    resultLabel.text = "\(manager.getList().count)"
    let ud = UserDefaults(suiteName: "group.com.jasonliang.demo")
    ud?.set(true, forKey: "key")
    ud?.synchronize()
  }

  @IBAction func addButtonTapped(_ sender: Any) {
    manager.addEntry(name: "Jason")
    refresh()
  }

}

