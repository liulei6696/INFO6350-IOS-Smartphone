//
//  Event.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation

public class Event: CustomStringConvertible {
    static var assignID = 5666
    public let id: Int
    public var name: String
    public var address: Address
    public var eventDescription: String
    public var start: Date
    public var end: Date
    
    public init(name: String, address: Address, description: String, start: Date, end: Date) {
        Event.assignID += 1
        self.id = Event.assignID
        self.name = name
        self.address = address
        self.eventDescription = description
        self.start = start
        self.end = end
    }

    public var description: String {
        return "id: \(self.id) name: \(self.name)\n" +
        "address: \(self.address)\n" +
        "description: \(self.eventDescription)\n" +
        "start date: \(self.start)\n" + "end date: \(self.end)\n"
        
    }
}
