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
    let description: String?
}

