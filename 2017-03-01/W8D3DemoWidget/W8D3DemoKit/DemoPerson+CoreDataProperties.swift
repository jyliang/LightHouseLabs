//
//  DemoPerson+CoreDataProperties.swift
//  W8D3Demo
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import Foundation
import CoreData


extension DemoPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DemoPerson> {
        return NSFetchRequest<DemoPerson>(entityName: "DemoPerson");
    }

    @NSManaged public var name: String?

}
