//
//  Lists+CoreDataProperties.swift
//  Todo
//
//  Created by Sudipto Roy on 1/29/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//
//

import Foundation
import CoreData


extension Lists {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lists> {
        return NSFetchRequest<Lists>(entityName: "Lists")
    }

    @NSManaged public var list_name: String?
    @NSManaged public var child_tasks: NSSet?

}

// MARK: Generated accessors for child_tasks
extension Lists {

    @objc(addChild_tasksObject:)
    @NSManaged public func addToChild_tasks(_ value: Tasks)

    @objc(removeChild_tasksObject:)
    @NSManaged public func removeFromChild_tasks(_ value: Tasks)

    @objc(addChild_tasks:)
    @NSManaged public func addToChild_tasks(_ values: NSSet)

    @objc(removeChild_tasks:)
    @NSManaged public func removeFromChild_tasks(_ values: NSSet)

}
