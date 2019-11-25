//
//  Address.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
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
