//
//  Address.swift
//  EmptyApp
//
//  Created by Lei on 10/16/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

public class Address: CustomStringConvertible{
    var street: String
    var city: String
    var state: String
    
    public init(street: String, city: String, state: String) {
        self.street = street
        self.city = city
        self.state = state
    }
    
    public var description: String {
        return "\(self.street), \(self.city), \(self.state)"
    }
}
