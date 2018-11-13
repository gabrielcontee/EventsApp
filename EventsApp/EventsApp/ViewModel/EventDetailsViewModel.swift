//
//  EventDetailsViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    
}

class EventDetailsViewModel: NSObject, DetailViewModelDelegate {
    
    var dataSource: EventsDetailsDataSourceProtocol!
    
    var currentEvent: Event? { return dataSource.getCurrentEvent(id: "1") }
    
    
    func fetchEventData(eventId: String, completion: @escaping ()->()){
        dataSource.fetchDetails(id: eventId) { (error) in
            if error == nil{
                completion()
            }else{
                print("Could not load event details")
                completion()
            }
        }
    }
    
}
