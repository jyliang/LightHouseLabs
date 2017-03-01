//
//  TodayViewController.swift
//  W8D3DemoWidget
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import NotificationCenter
import W8D3DemoKit

class TodayViewController: UIViewController, NCWidgetProviding {
    let manager = DemoKitManager()
  @IBOutlet weak var label: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      let ud = UserDefaults(suiteName: "group.com.jasonliang.demo")
//      let value = ud?.bool(forKey: "key")
      
      label.text = "\(manager.getList().count)"
//      label.text = "\(value)"// "\(manager.getList().count)"
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
