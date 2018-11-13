//
//  EventsTableViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class EventsTableViewModel: NSObject {
    
    private lazy var dataSource = EventsDataSource()
    
    private var events: [Event] { return dataSource.events }
    
    lazy var eventsBox: Box<[Event]> = Box([])
    
    lazy var selectedEventId: String = ""
    
    override init() {
        super.init()
        
        dataSource.fetchEvents { (error) in
            if error == nil{
                self.eventsBox.value = self.events
            }
        }
        
    }
    
    func event(for index: Int) -> Event?{
        guard events.isEmpty == false else {
            return nil
        }
        return events[index]
    }
    
    func numberOfEvents() -> Int{
        return events.count
    }
    
}
