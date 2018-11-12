//
//  ClientAPI.swift
//  EventsApp
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class ClientAPI {
    
    private let baseEndpointUrl = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events"
    private let session = URLSession(configuration: .default)
    
    /// Sends a request to API servers, calling the completion method when finished
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) {
        
        let endpoint = URL(string: baseEndpointUrl + request.resourceName)!
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                do {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    
                    let response = try JSONDecoder().decode(T.Response.self, from: data)
                    
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}



