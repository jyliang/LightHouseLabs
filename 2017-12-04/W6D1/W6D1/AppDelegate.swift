//
//  AppDelegate.swift
//  W6D1
//
//  Created by Jason Liang on 12/4/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
//    setupNotificationSettings()
    setupUNNotifcationSettings()
    registerCategories()
    
    UNUserNotificationCenter.current().delegate = self
    return true
  }
  
//  fileprivate func setupNotificationSettings() {
//    let notificationSettings = UIUserNotificationSettings(types:[ .badge, .alert, .sound], categories: nil)
//    UIApplication.shared.registerUserNotificationSettings(notificationSettings)
//  }
  
  fileprivate func setupUNNotifcationSettings() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
      // Enable or disable features based on authorization
      
    }
  }
  
  fileprivate func registerCategories() {
    let action1 = UNNotificationAction(identifier: "action1", title: "Action1", options: [.foreground])
    let action2 = UNNotificationAction(identifier: "action2", title: "Action2", options: [.foreground])
    
    let notificationCategory = UNNotificationCategory(identifier: "category1", actions: [action1, action2], intentIdentifiers: [], options: [])
    
    UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
//    let openAction = UNNotificationAction(identifier: "open",
//                                          title: "See Details", options: [.foreground])
//
//    let lateAction = UNNotificationAction(identifier: "late", title: "Running Late", options: [.foreground])
//
//    let callCategory = UNNotificationCategory(identifier: UPNNotificationType.callCategory.rawValue,
//                                              actions: [joinAction, messageAction, lateAction, openAction],
//                                              intentIdentifiers: [], options: [])
  }

  
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    print(response.actionIdentifier)
  }
  
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              didReceive response: UNNotificationResponse,
//                              withCompletionHandler completionHandler: @escaping () -> Void) {

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

