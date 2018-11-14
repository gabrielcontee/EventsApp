//
//  EventsDataSource.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol EventsDataSourceProtocol {
    func fetchEvents(completion: @escaping (Error?)->())
    var events: [Event] {get set}
}

protocol EventsDetailsDataSourceProtocol {
    func fetchDetails(id: String, completion: @escaping (Error?)->())
    func checkinRequest(eventId: String)
    var currentEvent: Event? {get}
}

protocol LoginDataSource {
    func setLoginData(name: String, email: String)
}

class EventsDataSource: NSObject, EventsDataSourceProtocol, EventsDetailsDataSourceProtocol, LoginDataSource {
    
    typealias Id = Int
    
    var clientAPI: ServiceProtocol!
    
    var events: [Event] = []
    
    var currentEvent: Event?
    
    var username: User?
    
    // Sends a fetch request for the list of tasks from API
    func fetchEvents(completion: @escaping (Error?)->()){
        
        clientAPI.send(GetEvents()) { [unowned self] (result) in
            switch result{
            case .success(let events):
                self.events = events
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
    
    func fetchDetails(id: String, completion: @escaping (Error?) -> ()) {
        
        clientAPI.send(GetEventDetails(id: id)) { [unowned self] (result) in
            switch result{
            case .success(let event):
                self.currentEvent = event
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
    
    private func getCurrentEvent(id: String) -> Event?{
        let event = events.filter({$0.id == id}).first
            ?? nil
        guard let current = event else{
            return nil
        }
        return current
    }
    
    func setLoginData(name: String, email: String) {
        self.username = User(name: name, email: email)
    }
    
    func checkinRequest(eventId: String){
        guard let event = currentEvent, let id = event.id, let name = self.username?.name, let email = self.username?.email else{
            return
        }
        
        let parameters: [String: Any] = ["eventId": id, "name": name, "email": email]
        
        clientAPI.post(parameters: parameters)
    }

}
