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
    
    var dataSource: EventsDataSourceProtocol!
}
