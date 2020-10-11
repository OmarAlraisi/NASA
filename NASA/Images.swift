//
//  Image.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Images : Decodable {
    
    // Image attributes
    var links:[Links]?
    var href:String?
    
    var data:[JData]?
    var title : String?
    var description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case links
        case href
        
        case data
        case title
        case description
        
    }
    
    init(from decoder: Decoder) throws {
        
        // Create the outer container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse href
        self.links = try container.decode([Links].self, forKey: .links)
        
        // Assign href
        if links != nil {
            self.href = self.links![0].href
        }
        
        // Create the data container
        self.data = try container.decode([JData].self, forKey: .data)
        
        if data != nil {
            if data![0].description != nil {
                self.description = data![0].description
            }
            if data![0].title != nil {
                self.title = data![0].title
            }
            data!.removeAll()
        }
    }
}
