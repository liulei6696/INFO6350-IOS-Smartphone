//
//  Extension.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/17/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
