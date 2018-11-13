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
    
    typealias DataSourceProtocol = EventsDetailsDataSourceProtocol & EventsDataSourceProtocol
    
    class func setup(){
        setupService()
        
        setupDataSource()
        
        setupTableViewModel()
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
        
        defaultContainer.storyboardInitCompleted(MainTableViewController.self) { (r, c) in
            let vm = r.resolve(TableViewModelDelegate.self)
            c.viewModel = vm
        }

    }

    private class func setupEventsViewModel(){
        defaultContainer.register(EventsViewModelDelegate.self) { r in
            let vm = EventsListViewModel()
            vm.dataSource = r.resolve(DataSourceProtocol.self)
            return vm
        }
    }

    private class func setupDetailsViewModel(){
        defaultContainer.register(DetailViewModelDelegate.self) { r in
            let vm = EventDetailsViewModel()
            vm.dataSource = r.resolve(DataSourceProtocol.self)
            return vm
        }
    }
    
    private class func setupTableViewModel(){
        defaultContainer.register(TableViewModelDelegate.self) { r in
            let vm = EventsTableViewModel()
            vm.dataSource = r.resolve(DataSourceProtocol.self)
            return vm
        }
    }
    
    private class func setupDataSource(){
        defaultContainer.register(DataSourceProtocol.self) { r in
            let ds = EventsDataSource()
            ds.clientAPI = r.resolve(ServiceProtocol.self)
            return ds
        }
    }
    
    private class func setupService(){
        defaultContainer.register(ServiceProtocol.self) { _ in
            return ClientAPI()
        }.inObjectScope(.container)
    }

}

