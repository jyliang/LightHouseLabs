//
//  Card.swift
//  W5D2
//
//  Created by Jason Liang on 10/3/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import W5D2Core

class Card: NSObject {
  weak var core1 : Core?
  //unowned let core2 : Core
  
  open func openFunction() {
  
  }
  
  public func publicFunction() {
    
  }
  
  private func privateFunction() {
  
  }
  
  fileprivate func filePrivateFunction() {
    self.privateFunction()
  }
  
  // same:
  func defaultFunction() {
    
  }
  
  internal func internalFunction() {
  
  }
}

extension Card : UITableViewDelegate {
  func test() {
    self.filePrivateFunction()
  }
}

extension Card : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
