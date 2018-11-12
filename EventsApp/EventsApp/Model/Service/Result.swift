//
//  Result.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void

