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

class EventsDataSource: NSObject, EventsDataSourceProtocol {

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
}
