//
//  EventService.swift
//  EmptyApp
//
//  Created by Lei on 10/17/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

public class EventService {
    
    public func allEventsInfoString(events: [Int: Event]) -> String{
        var res = ""
        for event in events.values {
            res = res + event.description + "\n"
        }
        return res
    }
}
