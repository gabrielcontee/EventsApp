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
}
