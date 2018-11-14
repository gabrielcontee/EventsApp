//
//  APIError.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}
