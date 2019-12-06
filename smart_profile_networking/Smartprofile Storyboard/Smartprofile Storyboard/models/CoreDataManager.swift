//
//  CoreDataManager.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/17/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var userId:Int16 = 555
    private var eventId:Int16 = 6666
    
    private init() {
    }
    
    public func getNextUserId() -> Int16 {
        self.userId += 1
        return self.userId
    }
    
    public func getNextEventId() -> Int16 {
        self.eventId += 1
        return self.eventId
    }
    
    func getAllUsers() -> [User] {
        var users = [User]()
        let userRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            users = try self.context.fetch(userRequest)
        }catch let error as NSError {
            print(error)
        }
        
        return users
    }
    
    func addUser(user: User) throws {
        self.context.insert(user)
        try self.context.save()
    }
    
    func deleteUser(user: User) throws {
        self.context.delete(user)
        try self.context.save()
    }
    
    func getAllEvents() -> [Event] {
        var events = [Event]()
        let eventRequest: NSFetchRequest<Event> = Event.fetchRequest()
        do {
            events = try self.context.fetch(eventRequest)
        }catch let error as NSError {
            print(error)
        }
        
        return events
    }
    
    func addEvent(event: Event) throws {
        self.context.insert(event)
        try self.context.save()
    }
    
    func deleteEvent(event: Event) throws {
        self.context.delete(event)
        try self.context.save()
    }
    
    func getAllAddresses() -> [Address] {
        var addresses = [Address]()
        let addressRequest: NSFetchRequest<Address> = Address.fetchRequest()
        do{
            addresses = try self.context.fetch(addressRequest)
        }catch let error as NSError {
            print (error)
        }
        return addresses
    }
    
    func addAddress(address: Address) throws {
        self.context.insert(address)
        try self.context.save()
    }
    
    func deleteAddress(address: Address) throws {
        self.context.delete(address)
        try self.context.save()
    }
    
    func addressString(_ address: Address) -> String{
        return "\(address.street ?? ""), \(address.city ?? ""), \(address.state ?? "")"
    }
    
    func initWithSampleData() {
        // delete all existing records
        let existingAddresses = self.getAllAddresses()
        let existingUsers = self.getAllUsers()
        let existingEvents = self.getAllEvents()
        for address in existingAddresses {
            self.context.delete(address)
        }
        for user in existingUsers {
            self.context.delete(user)
        }
        for event in existingEvents {
            self.context.delete(event)
        }
        // create and add user, address, event
        let address = Address(context: self.context)
        address.city = "Boston"
        address.street = "360 Huntington Ave"
        address.state = "MA"
        
        let user1 = User(context: self.context)
        user1.id = getNextUserId()
        user1.email = "liu.lei1@husky.neu.edu"
        user1.phone = "6178889090"
        user1.name = "Lei"
        user1.address = address
        user1.skills = ["Sing", "Dance", "Rap", "Basketball"]
        user1.interests = ["Run", "Climb"]
        
        let user2 = User(context: self.context)
        user2.name = "Tracy"
        user2.id = getNextUserId()
        user2.email = "wonder.girl@gmail.com"
        user2.phone = "6176666666"
        user2.address = address
        
        let event1 = Event(context: self.context)
        event1.id = getNextEventId()
        event1.name = "Football Champion"
        event1.address = address
        event1.eventDescription = "Inter-school championship with BU!"
        event1.start = transformStringToDate(dateString: "10/10/2019")!
        event1.end = transformStringToDate(dateString: "10/11/2019")!
        
        let event2 = Event(context: self.context)
        event2.id = getNextEventId()
        event2.name = "Apple Engineer Summit"
        event2.address = address
        event2.eventDescription = "Welcome to WWDC 2019"
        event2.start = transformStringToDate(dateString: "10/22/2019")!
        event2.end = transformStringToDate(dateString: "10/13/2019")!
        
        user1.subscriptions = [event1.id]
        
        self.context.insert(address)
        self.context.insert(user1)
        self.context.insert(user2)
        self.context.insert(event1)
        self.context.insert(event2)
        
        do {
            try self.context.save()
        }catch let error as NSError {
            print("❌ init database with sample data throw error [\(error)]")
            return
        }
        
        users[user1.id] = user1
        users[user2.id] = user2
        events[event1.id] = event1
        events[event2.id] = event2
        
        print("init database completed")
    }
}
