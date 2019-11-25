//
//  User.swift
//  EmptyApp
//
//  Created by Lei on 10/16/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

public class User: CustomStringConvertible{
    static var assignID:Int = 333
    public var id: Int
    public var name: String
    var phone: String?
    var email: String
    var address: Address?
    var interests: [String] = []
    var skills: [String] = []
    var subscriptions: [Event] = []
    
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
    
    public func setName(newName: String) {
        self.name = newName
    }
    
    public func setPhone(newPhone: String) {
        self.phone = newPhone
    }
    
    public func setEmail(newEmail: String) {
        self.email = newEmail
    }
    
    public func setAddress(newAddress: Address) {
        self.address = newAddress
    }
    
    public func getId() -> Int{
        return self.id
    }
    
    public func addInterest(_ interest: String) {
        self.interests.append(interest)
    }
    
    public func addSkill(_ skill: String) {
        self.skills.append(skill)
    }
    
    public func addSubscription(_ sub: Event) {
        self.subscriptions.append(sub)
    }
    
    public var description: String {
        return "id: \(self.id) name: \(self.name)\n" +
        "phone: \(self.phone!)\nemail: \(self.email)\n" +
        "address: \(self.address!)\n"
    }
}
