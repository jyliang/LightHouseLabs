//
//  AppDelegate.swift
//  DebuggingExerciseSwift
//
//  Created by steve on 2016-04-14.
//  Copyright © 2016 steve. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // creates some dummy data
        let dummyData = UIFont.familyNames
        
        let viewController = self.window?.rootViewController as! ViewController
        viewController.data = dummyData
        return true
    }
}

