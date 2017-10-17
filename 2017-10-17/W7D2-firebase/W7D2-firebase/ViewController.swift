//
//  ViewController.swift
//  W7D2-firebase
//
//  Created by Jason Liang on 10/17/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabaseUI

class ViewController: UIViewController {
  
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ref = Database.database().reference()
    
    let childRef = Database.database().reference(withPath: "tasks")
    
    childRef.observe(DataEventType.value) { (snapshot) in
      let value = snapshot.value
      print("\(value)")
    }
    
   
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

