//
//  Model.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func getFeed( feed:[Images])
}
class Model {
    
    var delegate:ModelDelegate?
    
    var items:[Images]?
    
    func getImageCollecttion () {
        
        // Create URL
        let url = URL(string: Constants.IMAGE_LIBRARY_API_URL + Constants.SEARCH_KEYWORD)
        
        // Validate it
        guard url != nil else {
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // Create data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors and data
            guard error == nil && data != nil else {
                return
            }
            
            do {
                
                // Create JSON decoder
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                
                // Check response isn't nill
                guard response.items != nil else {
                    return
                }
                
                // Call the delegate method
                DispatchQueue.main.async {
                    self.delegate?.getFeed(feed: response.items!)
                }
            } catch {
                return
            }
            
        }
        
        // Resume data task
        dataTask.resume()
    }
}
