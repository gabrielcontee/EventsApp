//
//  UIImageView.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(url: URL, completion: @escaping ()->()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    completion()
                    return
            }
            DispatchQueue.main.async() {
                self.image = image
                completion()
            }
            }.resume()
    }
    
    func downloaded(link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(url: url) {}
    }
}

