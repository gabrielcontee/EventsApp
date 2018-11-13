//
//  Listener.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class Listener<T> {
    private var _listeners = [String:T]()
    
    var listeners: [T] { return _listeners.map({$0.value})}
    
    func add(listener: T, forKey key: String) {
        _listeners[key] = listener
    }
    
    func remove(forKey key: String) {
        if _listeners.keys.contains(key) {
            _listeners.removeValue(forKey: key)
        }
    }
}
