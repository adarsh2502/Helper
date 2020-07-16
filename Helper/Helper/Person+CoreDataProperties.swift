//
//  Person+CoreDataProperties.swift
//  Helper
//
//  Created by Adarsh Gupta on 18/05/19.
//  Copyright © 2019 Adarsh Gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var profession: String?
    @NSManaged public var experience: String?
    @NSManaged public var university: String?

}
