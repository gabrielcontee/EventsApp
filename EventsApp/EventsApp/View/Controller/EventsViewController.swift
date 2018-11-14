//
//  EventsViewController.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController{
    
    var viewModel: EventsViewModelDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchAllTasks {}
    }
}
