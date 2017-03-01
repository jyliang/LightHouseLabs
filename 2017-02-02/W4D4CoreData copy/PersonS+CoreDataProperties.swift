//
//  PersonS+CoreDataProperties.swift
//  W4D4CoreData
//
//  Created by Jason Liang on 3/1/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PersonS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonS> {
        return NSFetchRequest<PersonS>(entityName: "PersonS");
    }

    @NSManaged public var firstName: String?

}
