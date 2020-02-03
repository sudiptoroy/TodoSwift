//
//  Tasks+CoreDataProperties.swift
//  Todo
//
//  Created by Sudipto Roy on 2/3/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var task_name: String?
    @NSManaged public var parent_list: Lists?

}
