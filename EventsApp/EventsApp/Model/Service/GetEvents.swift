//
//  GetEvents.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct GetEvents: APIRequest {
    
    typealias Response = [Event]
    
    var resourceName: String {
        return "/events"
    }
    
    init() {
    }
}
