//
//  Address+CoreDataProperties.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/18/19.
//  Copyright © 2019 Lei. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var street: String?

}
