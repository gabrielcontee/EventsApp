//
//  Event.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct Event: Decodable{
    
    let id: String?
    let title: String?
    let image: String?
    let email: String?
    
    init(id: String? = "", title: String? = "", image: String = "", email: String = "") {
        self.id = id
        self.title = title
        self.image = image
        self.email = email
    }
}
