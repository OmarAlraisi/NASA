//
//  CacheManager.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/11/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

class CacheManager {
    
    // Create adictionary to store data for urls
    var cache = [String : Data]()
    
    // Create a method to store the data
    func storeData (_ url: String, _ imageDate: Data) {
        
        cache[url] = imageDate
    }
    
    // Create a method to etrieve the data
    func retrieveData (_ url: String) -> Data? {
        
        return cache[url]
    }
}
