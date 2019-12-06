//
//  Event+CoreDataProperties.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/18/19.
//  Copyright © 2019 Lei. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var end: Date?
    @NSManaged public var eventDescription: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var start: Date?
    @NSManaged public var address: Address?

}
