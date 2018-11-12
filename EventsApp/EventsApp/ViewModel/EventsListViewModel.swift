//
//  EventsListViewModel.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol EventsViewModelDelegate {
    
}

class EventsListViewModel: NSObject {
    
    var dataSource: EventsDataSourceProtocol!
}
