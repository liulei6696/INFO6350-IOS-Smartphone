//
//  Utils.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/4/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation

public func isEmailValid(_ email: String) -> Bool {
    let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailPattern)
    return emailPred.evaluate(with: email)
}

public func isPhoneNumValid(_ phone: String) -> Bool {
    let phonePattern = "[1-9][0-9]{9,9}"
    let phonePred = NSPredicate(format: "SELF MATCHES %@", phonePattern)
    return phonePred.evaluate(with: phone)
}

public func transformStringToDate(dateString: String) -> Date? {
    let date_formatter = DateFormatter()
    date_formatter.dateFormat = "MM/dd/yyyy"
    return date_formatter.date(from: dateString)
}

public func initWithSampleData() {
    let address = Address(street: "360 Huntington Ave", city: "Boston", state: "MA")
    let user1 = User(name: "Lei", phone: "6178889090", email: "liu.lei1@husky.neu.edu", address: address)
    users[user1.id] = user1
    user1.skills.append("Sing")
    user1.skills.append("Dance")
    user1.skills.append("Rap")
    user1.skills.append("Basketball")
    user1.interests.append("Run")
    user1.interests.append("Climb")
    
    let user2 = User(name: "Tracy", phone: "6176666666", email: "wonder.girl@gmail.com", address: address)
    users[user2.id] = user2
    
    let event1 = Event(name: "Football Champion", address: address, description: "Inter-school championship with BU!", start: transformStringToDate(dateString: "10/10/2019")!, end: transformStringToDate(dateString: "10/11/2019")!)
    events[event1.id] = event1
    let event2 = Event(name: "Apple Engineer Summit", address: address, description: "Welcome to WWDC 2019", start: transformStringToDate(dateString: "10/22/2019")!, end: transformStringToDate(dateString: "10/13/2019")!)
    events[event2.id] = event2
    
    user1.subscriptions.append(event1.id)
    
    print("init with sample data - 2 users and 2 events - completed!")
}
