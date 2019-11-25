//
//  Event.swift
//  EmptyApp
//
//  Created by Lei on 10/16/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

public class Event: CustomStringConvertible {
    static var assignID = 5666
    public let id: Int
    public var name: String
    var address: Address
    var eventDescription: String
    var start: Date
    var end: Date
    
    public init(name: String, address: Address, description: String, start: Date, end: Date) {
//        self.id = UUID().uuidString
        Event.assignID += 1
        self.id = Event.assignID
        self.name = name
        self.address = address
        self.eventDescription = description
        self.start = start
        self.end = end
    }
    
    public func setName(newName: String) {
        self.name = newName
    }
    
    public func setAddress(newAddress: Address) {
        self.address = newAddress
    }
    
    public func setDescription(description: String) {
        self.eventDescription = description
    }
    
    public func setStartDate(newStart: Date) {
        self.start = newStart
    }
    
    public func setEndDate(newEnd: Date) {
        self.end = newEnd
    }
    
    
    public var description: String {
        return "id: \(self.id) name: \(self.name)\n" +
        "address: \(self.address)\n" + "description: \(self.eventDescription)\n" +
        "start date: \(self.start)\n" + "end date: \(self.end)\n"
        
    }
}
