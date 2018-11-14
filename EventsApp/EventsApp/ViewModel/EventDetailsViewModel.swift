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
    func makeCheckin()
    var eventId: String {get set}
    var eventTitle: Box<String> {get}
    var eventImage: Box<String> {get}
    var eventDescription: Box<String> {get}
}

class EventDetailsViewModel: NSObject, DetailViewModelDelegate {
    
    var dataSource: EventsDetailsDataSourceProtocol!
    
    var currentEvent: EventDetails? { return dataSource?.currentEvent }
    
    var eventId: String = ""
    
    var eventTitle: Box<String> = Box("")
    var eventImage: Box<String> = Box("")
    var eventDescription: Box<String> = Box("")
    
    func fetchEventData(eventId: String, completion: @escaping ()->()){
        dataSource.fetchDetails(id: eventId) { [unowned self] (error) in
            if error == nil{
                guard let cv = self.dataSource.currentEvent, let title = cv.title, let image = cv.image, let description = cv.description else{
                    completion()
                    return
                }
                self.eventTitle.value = title
                self.eventImage.value = image
                self.eventDescription.value = description
                
                completion()
            }else{
                print("Could not load event details")
                completion()
            }
        }
    }
    
    func makeCheckin(){
        dataSource.checkinRequest(eventId: self.eventId)
    }
    
}
