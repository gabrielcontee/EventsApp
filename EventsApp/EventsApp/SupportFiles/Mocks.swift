//
//  Mocks.swift
//  EventsAppTests
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class Mocks: NSObject {
    
    static var shared = Mocks()
    
    lazy var event1 = Event(id: "", title: "", image: "")
}
