//
//  DemoKitManager.swift
//  W8D3Demo
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit
import CoreData

public class DemoKitManager: NSObject {
  public func addEntry(name:String) {
    let context = getContext()
    let person : DemoPerson = NSEntityDescription.insertNewObject(forEntityName: "DemoPerson", into: context) as! DemoPerson
    person.name = name
    DemoHelper.sharedInstance.saveContext()
  }
  
  public func getList() -> [DemoPerson] {
    let request : NSFetchRequest = DemoPerson.fetchRequest()
    
    if let result = try? getContext().fetch(request) {
      return result
    }
    
      
    
    return []
    
  }
  
  private func getContext () -> NSManagedObjectContext  {
    return DemoHelper.sharedInstance.persistentContainer.viewContext
  }
}
