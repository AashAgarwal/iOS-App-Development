//
//  Person+CoreDataProperties.swift
//  DataPersistenceProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var siblings: Set<Person>?

}

// MARK: Generated accessors for siblings
extension Person {

    @objc(addSiblingsObject:)
    @NSManaged public func addToSiblings(_ value: Person)

    @objc(removeSiblingsObject:)
    @NSManaged public func removeFromSiblings(_ value: Person)

    @objc(addSiblings:)
    @NSManaged public func addToSiblings(_ values: NSSet)

    @objc(removeSiblings:)
    @NSManaged public func removeFromSiblings(_ values: NSSet)

}
