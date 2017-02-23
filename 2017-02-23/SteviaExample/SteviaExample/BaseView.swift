//
//  BaseView.swift
//  SteviaExample
//
//  Created by Jason Liang on 2/23/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import Stevia

class BaseView: UIView {

  let leftButton = UIButton(type: UIButtonType.roundedRect)
  let rightButton = UIButton(type: UIButtonType.roundedRect)
  
  
  convenience init() {
    self.init(frame:CGRect.zero)
    configure()
    
  }
  
  func configure() {
    attachActions()
    self.backgroundColor = .clear
    self.sv(leftButton, rightButton)
    
    
    leftButton.size(50).top(100).left(50)
    rightButton.size(60).top(200)
    

    alignVertically(leftButton,rightButton)
    
    
//    self.layout(
//      100,
//      |-20-leftButton.size(40) - 100 - rightButton.size(40)
//    )
    leftButton.backgroundColor = .red
    rightButton.backgroundColor = .green
  }

  func attachActions() {
    leftButton.addTarget(self, action: #selector(BaseView.moveLeftButtonToTheBottom), for: UIControlEvents.touchUpInside)
  }
  
  func moveLeftButtonToTheBottom() {
    UIView.animate(withDuration: 1) {
      self.leftButton.size(60)
//      self.leftButton.widthConstraint?.constant = 60
      self.layoutIfNeeded()
    }
  }

}
