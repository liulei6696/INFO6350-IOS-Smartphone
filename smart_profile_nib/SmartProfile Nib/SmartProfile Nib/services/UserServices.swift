//
//  UserServices.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import Foundation

public var users = [Int: User]()


public class UserServices {
    
    public static func allUsersInfoString() -> String{
        var res = ""
        for user in users.values {
            res = res + user.description + "\n"
        }
        return res
    }
    
    public static func subscribeToEvent(userId: Int, eventId: Event) {
        
    }
}
