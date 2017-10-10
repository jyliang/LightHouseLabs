//
//  ViewController.swift
//  W6D1-Assignment
//
//  Created by Jason Liang on 10/10/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let mealManager = MealsManager()
    mealManager.getSearchResults { (meal, error) in
      print("\(meal) + \(error)")
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

