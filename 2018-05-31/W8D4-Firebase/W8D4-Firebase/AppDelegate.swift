//
//  AppDelegate.swift
//  W8D4-Firebase
//
//  Created by Jason Liang on 5/31/18.
//  Copyright © 2018 Jason Liang. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseMessaging
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    FirebaseApp.configure()
    registerNotifications(application)
    Messaging.messaging().delegate = self
    return true
  }
  
  func registerNotifications(_ application: UIApplication) {
    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self
      
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: {_, _ in })
    } else {
      let settings: UIUserNotificationSettings =
        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }
    
    application.registerForRemoteNotifications()
  }

  //MARK: Notfications
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    print(response)
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    print(notification)
  }
  
  // FCM - Firebase Cloud Messaging
  
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    guard let token = Messaging.messaging().fcmToken else { return }
    print("FCM token: \(token)")
    
    let ref = Database.database().reference().child("devices")
    ref.updateChildValues([token:true])
    
  }


}

