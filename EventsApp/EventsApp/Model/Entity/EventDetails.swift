//
//  EventDetails.swift
//  EventsApp
//
//  Created by Gabriel Conte on 13/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct EventDetails: Decodable{
    
    let id: String?
    let title: String?
    let price: Float?
    let image: String?
    let email: String?
    let description: String?
    
    init(id: String? = "", title: String? = "", price: Float?, image: String = "", email: String = "", description: String?) {
        self.id = id
        self.title = title
        self.image = image
        self.email = email
        self.price = price
        self.description = description
    }
    
}

