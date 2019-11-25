//
//  UserService.swift
//  EmptyApp
//
//  Created by Lei on 10/17/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

public class UserService {
    
    public func allUsersInfoString(users: [Int: User]) -> String{
        var res = ""
        for user in users.values {
            res = res + user.description + "\n"
        }
        return res
    }
}
