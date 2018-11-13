//
//  MainTableViewController.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

private let reuseIdentifier = String(describing: MainTableViewCell.self)
private let detailsSegue = "showDetails"

class MainTableViewController: UITableViewController {
    
    private lazy var viewModel = EventsTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        viewModel.eventsBox.bind(key: String(describing: self)) { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.rowHeight = 400.0
    }
}

// Datasource
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEvents()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MainTableViewCell
        
        guard let data = viewModel.event(for: indexPath.row), let title = data.title, let image = data.image else{
            return UITableViewCell()
        }
        
        cell.setup(title: title, imageURL: image)
        
        return cell
    }
}

// Delegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: detailsSegue, sender: self)
    }
}
