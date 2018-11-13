//
//  MainTableViewCell.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    func setup(title: String, imageURL: String) {
        self.cellTitle.text = title
        self.contentImageView.downloaded(link: imageURL)
    }
    
}
