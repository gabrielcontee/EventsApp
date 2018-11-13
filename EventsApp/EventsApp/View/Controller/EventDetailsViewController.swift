//
//  EventDetailsViewController.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController{
    
    var viewModel: DetailViewModelDelegate!
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var eventDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.eventTitle.bind(key: String(describing: self)) { (result) in
            self.eventTitleLabel.text = result
        }
        viewModel.eventImage.bind(key: String(describing: self)) { (result) in
            self.eventImageView.downloaded(link: result)
        }
        viewModel.eventDescription.bind(key: String(describing: self)) { (result) in
            self.eventDescription.text = result
        }
        
        
        
        viewModel.fetchEventData(eventId: viewModel.eventId) {
        }
        
    }
    
    
}
