//
//  DemoHelper.swift
//  W8D3Demo
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import CoreData

public class DemoHelper: NSObject {

  public static let sharedInstance = DemoHelper()
  // MARK: - Core Data stack
  
  public lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
     */
    
    
    let url = Bundle(for: DemoHelper.self).url(forResource: "W8D3Demo", withExtension: "momd")
    let managedObjectModel = NSManagedObjectModel(contentsOf: url!)!
    
    let container = NSPersistentContainer(name: "Demo", managedObjectModel: managedObjectModel)
    
    let coordinator = container.persistentStoreCoordinator
    
    //NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    
    
    let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.jasonliang.demo")
    let storeURL = groupURL?.appendingPathComponent("demo.sqlite")
    
    let options = [NSInferMappingModelAutomaticallyOption : true, NSMigratePersistentStoresAutomaticallyOption : true]
    
    try! coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)

    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        
        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  public func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }

}
