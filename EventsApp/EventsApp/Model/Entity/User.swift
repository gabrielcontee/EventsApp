//
//  User.swift
//  EventsApp
//
//  Created by Gabriel Conte on 14/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct User{
    
    let name: String
    let email: String
    
    init(name: String = "", email: String = "") {
        self.name = name
        self.email = email
    }
}
