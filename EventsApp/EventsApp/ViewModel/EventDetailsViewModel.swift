//
//  EventDetailsViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    
    func fetchEventData(eventId: String, completion: @escaping ()->())
    var eventId: String {get set}
}

class EventDetailsViewModel: NSObject, DetailViewModelDelegate {
    
    var dataSource: EventsDetailsDataSourceProtocol!
    
    var currentEvent: EventDetails? { return dataSource?.currentEvent }
    
    var eventId: String = ""
    
    lazy var eventTitle: Box<String> = Box("")
    lazy var eventImage: Box<String> = Box("")
    lazy var eventDescription: Box<String> = Box("")
    
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
