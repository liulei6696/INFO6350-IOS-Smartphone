//
//  EventServices.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation

public var events = [Int: Event]()

public class EventService {
    
    public static func allEventInfoString() -> String {
        return events.values.map{($0).description}.joined(separator: "\n")
    }
}
