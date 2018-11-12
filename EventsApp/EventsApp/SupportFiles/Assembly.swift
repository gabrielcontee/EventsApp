//
//  Assembly.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard{
    
    class func setup(){
        setupDataSource()
        
        setupEventsViewModel()
        setupDetailsViewModel()
        
        setupViewController()
    }
    
    
    
    private class func setupViewController(){
        
        defaultContainer.storyboardInitCompleted(EventsViewController.self) { (r, c) in
            c.viewModel = r.resolve(EventsViewModelDelegate.self)
        }

        defaultContainer.storyboardInitCompleted(EventDetailsViewController.self) { (r, c) in
            let vm = r.resolve(DetailViewModelDelegate.self)
            c.viewModel = vm
        }

    }

    private class func setupEventsViewModel(){
        defaultContainer.register(EventsListViewModel.self) { r in
            let vm = EventsListViewModel()
            vm.dataSource = r.resolve(EventsDataSourceProtocol.self)
            return vm
        }
    }

    private class func setupDetailsViewModel(){
        defaultContainer.register(EventDetailsViewModel.self) { r in
            let vm = EventDetailsViewModel()
            vm.dataSource = r.resolve(EventsDataSourceProtocol.self)
            return vm
        }
    }
    
    private class func setupDataSource(){
        defaultContainer.register(EventsDataSourceProtocol.self) { _ in
            return EventsDataSource()
            }.inObjectScope(.container)
    }
}

