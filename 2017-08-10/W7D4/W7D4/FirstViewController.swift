//
//  FirstViewController.swift
//  W7D4
//
//  Created by Jason Liang on 8/10/17.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit
import Stevia

class FirstViewController: UIViewController {

  let email = UITextField()
  let password = UITextField()
  let login = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .blue
    
    email.style(fieldStyle)
    password.style(fieldStyle).style(passwordFieldStyle)
    login.style(buttonStyle).tap(loginTapped)
    
    self.view.sv([email, password, login])
    
    self.view.layout(
      100,
      |-email-| ~ 80,
      10,
      password.fillHorizontally(m: 8).height(80),
      //password.left(8).right(8).height(80),
      //|-password-| ~ 80
      "",
      login.fillHorizontally().height(80),
      //|login| ~ 80,
      50
    )
    
    
  }
  
  func fieldStyle(f:UITextField) {
    f.borderStyle = .roundedRect
    f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
    f.returnKeyType = .next
  }
  
  func passwordFieldStyle(f:UITextField) {
    f.isSecureTextEntry = true
    f.returnKeyType = .done
  }
  
  func buttonStyle(b:UIButton) {
    b.backgroundColor = .lightGray
  }

  
  func loginTapped() {
    print("login tapped")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

