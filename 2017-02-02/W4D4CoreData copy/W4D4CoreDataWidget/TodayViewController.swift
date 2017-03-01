//
//  TodayViewController.swift
//  W4D4CoreDataWidget
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import NotificationCenter
import W4D4CoreDataKit

class TodayViewController: UIViewController, NCWidgetProviding {
  
  @IBOutlet weak var label: UILabel!
  let helper = CoreDataHelper()
        
    override func viewDidLoad() {
        super.viewDidLoad()
      getResult()
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
  
  func getResult() {
    let request = Person.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
    request.sortDescriptors = [sortDescriptor]
    let context = helper.persistentContainer.viewContext
    
    let result = try! context.fetch(request)
    self.label.text = "\(result.count)"
  }
    
}
