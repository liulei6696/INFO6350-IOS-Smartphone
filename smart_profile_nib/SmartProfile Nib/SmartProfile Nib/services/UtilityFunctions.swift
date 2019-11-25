//
//  UtilityFunctions.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
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

public func initializeWithSampleData() {
    let address = Address(street: "360 Huntington Ave", city: "Boston", state: "MA")
    let user = User(name: "Lei", phone: "6178889090", email: "liu.lei1@husky.neu.edu", address: address)
    users[user.id] = user
    user.skills.append("Sing")
    user.skills.append("Dance")
    user.skills.append("Rap")
    user.skills.append("Basketball")
    user.interests.append("Run")
    user.interests.append("Climb")
    
    let event1 = Event(name: "Football Champion", address: address, description: "Inter-school championship with BU!", start: transformStringToDate(dateString: "10/10/2019")!, end: transformStringToDate(dateString: "10/11/2019")!)
    events[event1.id] = event1
    let event2 = Event(name: "Apple Engineer Summit", address: address, description: "Welcome to WWDC 2019", start: transformStringToDate(dateString: "10/22/2019")!, end: transformStringToDate(dateString: "10/13/2019")!)
    events[event2.id] = event2
    
    user.subscriptions.append(event1.id)
    
    print("init with sample data - 1 user and 2 events - completed!")
}
