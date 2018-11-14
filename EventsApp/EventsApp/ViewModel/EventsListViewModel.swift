//
//  EventsListViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol EventsViewModelDelegate {
    func fetchAllTasks(completion:(()->())?)
    func task(for index: Int) -> String?
    func numberOfTasks() -> Int
    var events: [Event] {get}
}

protocol ErrorAlertDelegate {
    func alertError(msg: String)
}

class EventsListViewModel: NSObject, EventsViewModelDelegate {
    
    var dataSource: EventsDataSourceProtocol!
    

    var errorDelegate: ErrorAlertDelegate?
    
    var events: [Event] { return dataSource.events }
    
    func numberOfTasks() -> Int{
        return events.count
    }
    
    func task(for index: Int) -> String?{
        guard events.isEmpty == false else {
            return nil
        }
        return events[index].title
    }
    
    func fetchAllTasks(completion:(()->())? = nil){
        dataSource.fetchEvents { [unowned self] (error) in
            if error == nil{
                print("Finished fetching events!")
                print(self.events)
                completion?()
            }else{
                self.errorDelegate?.alertError(msg: "Fetch failed, please try again")
            }
        }
    }
}
