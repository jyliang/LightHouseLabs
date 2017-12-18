//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Jason Liang on 12/17/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func addEntryTapped(_ sender: Any) {
    guard let text = textField.text else {
      return
    }
    
    if text.count > 0 {
      let ref = Database.database().reference().child("users")
      let key = ref.child("users").childByAutoId().key
      ref.updateChildValues([key:text])
      textField.text = ""
    }
  }
  
  @IBAction func showEntriesTapped(_ sender: Any) {
    self.performSegue(withIdentifier: "detail", sender: nil)
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  

}

