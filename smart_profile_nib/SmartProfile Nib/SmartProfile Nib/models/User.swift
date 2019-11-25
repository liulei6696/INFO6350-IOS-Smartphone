//
//  User.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation

public class User: CustomStringConvertible {
    static var assignID:Int = 333
    public var id: Int
    public var name: String
    public var phone: String?
    public var email: String
    public var address: Address?
    public var interests: [String] = []
    public var skills: [String] = []
    public var subscriptions: [Int] = []
    
    public init(name: String, email: String) {
        User.assignID += 1
        self.id = User.assignID
        self.name = name
        self.email = email
    }
    public convenience init(name: String, phone: String, email: String, address: Address) {
        self.init(name: name, email: email)
        self.phone = phone
        self.address = address
    }
    
    public func getSubscriptionNameArray() -> [String] {
        var res = [String]()
        for eventId in subscriptions {
            res.append(events[eventId]?.name ?? "")
        }
        return res
    }
    
    public var description: String {
        return "id: \(self.id) name: \(self.name)\n" +
        "phone: \(self.phone!)\nemail: \(self.email)\n" +
        "address: \(self.address!)\n" +
        "skills: \(self.skills.joined(separator: ","))\n" +
        "interests: \(self.interests.joined(separator: ","))\n" +
        "subscriptions: \(self.getSubscriptionNameArray().joined(separator: ","))\n"
    }
}
