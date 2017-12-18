//
//  ViewController.swift
//  W8D1-Firebase
//
//  Created by Jason Liang on 12/18/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func addEntryTapped(_ sender: Any) {
    //there's some text for us to enter
    
    guard let text = textField.text else { return }
    if text.count > 0 {
      let ref = Database.database().reference().child("users")
      let key = ref.child("users").childByAutoId().key
      ref.updateChildValues([key:text])
      textField.text = ""
    }
  }
  
}

