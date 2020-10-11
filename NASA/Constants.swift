//
//  Constants.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "tuS7vrKgad8KjyABVfQTF4loWCXZTk1Iczja46KH"
    
    // Image library doesn't require a key
    static var ENDPOINT = "/search?q="
    static var SEARCH_KEYWORD = ""
    static var IMAGE_LIBRARY_API_URL = "https://images-api.nasa.gov/search?media_type=image&q="
}
/*https://images-api.nasa.gov/search?q=mars&media_type=image&page=1
 https://images-api.nasa.gov\(Constants.ENDPOINT)\(Constants.SEARCH_KEYWORD)&media_type=image&page=1
 */