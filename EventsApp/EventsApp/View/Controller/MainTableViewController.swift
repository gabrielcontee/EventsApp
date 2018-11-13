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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}

// Datasource
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MainTableViewCell
        cell.setup(title: "Cell #\(indexPath.row)", imageURL: "url")
        return cell
    }
}

// Delegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: detailsSegue, sender: self)
    }
}
