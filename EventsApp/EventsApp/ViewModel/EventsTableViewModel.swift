//
//  EventsTableViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol TableViewModelDelegate {
    func event(for index: Int) -> Event?
    func numberOfEvents() -> Int
    var eventsBox: Box<[Event]> {get set}
    var selectedEventId: String {get set}
    func fetchEvents()
}

class EventsTableViewModel: NSObject, TableViewModelDelegate {
    
    var dataSource: EventsDataSourceProtocol!
    
    private var events: [Event] { return dataSource.events }
    
    var eventsBox: Box<[Event]> = Box([])
    
    var selectedEventId: String = ""
    
    init(dataSource: EventsDataSourceProtocol?) {
        self.dataSource = dataSource
        
        super.init()
        
        fetchEvents()
        
    }
    
    func fetchEvents(){
        dataSource?.fetchEvents { [unowned self] (error) in
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
