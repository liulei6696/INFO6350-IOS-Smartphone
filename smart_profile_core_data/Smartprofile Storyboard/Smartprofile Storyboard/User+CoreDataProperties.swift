//
//  User+CoreDataProperties.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/18/19.
//  Copyright © 2019 Lei. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int16
    @NSManaged public var interests: [String]?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var skills: [String]?
    @NSManaged public var subscriptions: [Int16]?
    @NSManaged public var address: Address?

}
