//
//  GetEventDetails.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct GetEventDetails: APIRequest {
    
    typealias Response = Event
    
    var resourceName: String {
        return "/events/\(id)"
    }
    
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}
