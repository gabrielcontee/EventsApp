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
    func getCurrentEvent(id: String) -> Event?
}

class EventsDataSource: NSObject, EventsDataSourceProtocol, EventsDetailsDataSourceProtocol {

    typealias Id = Int
    
    private lazy var clientAPI = ClientAPI()
    
    var events: [Event] = []
    
    // Sends a fetch request for the list of tasks from API
    func fetchEvents(completion: @escaping (Error?)->()){
        
        clientAPI.send(GetEvents()) { (result) in
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
        
    }
    
    func getCurrentEvent(id: String) -> Event?{
        let event = events.filter({$0.id == id}).first
            ?? nil
        guard let current = event else{
            return nil
        }
        return current
    }
}
