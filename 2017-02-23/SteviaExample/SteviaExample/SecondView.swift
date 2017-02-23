//
//  SecondView.swift
//  SteviaExample
//
//  Created by Jason Liang on 2/23/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import Stevia

class SecondView: BaseView {

//  let v = UIView()
//  
//  convenience init() {
//    self.init(frame: CGRect.zero)
//    configure()
//  }
//
//  override func configure() {
//    super.configure()
//    self.sv(v)
//    v.size(100).bottom(100).centerHorizontally()
//    v.backgroundColor = .purple
//    self.rightButton.widthConstraint?.constant = 100
//    self.rightButton.heightConstraint?.constant = 100
//  }
  
  
  let email = UITextField()
  let password = UITextField()
  let login = UIButton()
  
  convenience init() {
    self.init(frame:CGRect.zero)
    backgroundColor = .white
    
    sv(
      email.placeholder("Email").style(fieldStyle).style(fontStyle),
      password.placeholder("Password").style(fontStyle).style(fieldStyle).style(passwordFieldStyle),
      login.text("Login").style(buttonStyle).tap(loginTapped)
    )
    
    layout(
      100,
      |-email-| ~ 80,
      8,
      |-password-| ~ 80,
      "",
      |login| ~ 80,
      0
    )
  }
  
  func fontStyle(f:UITextField) {
    f.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
  }
  
  func fieldStyle(f:UITextField) {
    f.borderStyle = .roundedRect
    
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
    //Do something
  }
  
}
