//
//  ViewController.swift
//  W6D1
//
//  Created by Jason Liang on 12/4/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func triggerUILocalNotification(_ sender: Any) {
    let notification = UILocalNotification()
    //creates trigger date
    let calendar = Calendar.current
    var seconds = DateComponents()
    seconds.second = 3
    let date = (calendar as NSCalendar).date(byAdding: seconds, to: Date(), options: NSCalendar.Options.matchStrictly)
    
    notification.fireDate = date
    notification.alertBody = "UILocalNotification Triggered!"
    notification.alertTitle = "Alert Title"
    notification.alertAction = "Action!"
    notification.applicationIconBadgeNumber = 10000
    notification.soundName = "sound.caf"
    
    UIApplication.shared.scheduleLocalNotification(notification)
  }
  
  @IBAction func triggerUNUserNotification(_ sender: Any) {
    //1. create unusernotification requests
  
        //--content
        //--actions
        //--triggers
    
    let notificationIdentifier = "unique notification id"
    
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = "Notification Title"
    notificationContent.categoryIdentifier = "category1"
    notificationContent.sound = UNNotificationSound.init(named: "sound.caf")
    
    
    let notifcationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    
    
    let request = UNNotificationRequest(identifier: notificationIdentifier, content: notificationContent, trigger: notifcationTrigger)
    
    
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
    
    //2. add these requests to the unusernotifcationcenter
    
    
//    UNUserNotificationCenter.current().add(request) { (error) in
//      if let error = error {
//        DDLogError(error.localizedDescription)
//      }
//      self.isCreatingRequest = false
//      DispatchQueue.main.async {
//        self.dequeueRequest()
//      }
//    }
  }
}

