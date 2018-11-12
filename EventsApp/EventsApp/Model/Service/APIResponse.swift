//
//  APIResponse.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

struct APIResponse<Response: Decodable>: Decodable {
    /// Whether it was ok or not
    let status: String?
    /// Message that usually gives more information about some error
    let message: String?
    /// Requested data
    let data: ResponseContainer<Response>?
}

