//
//  Response.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var items:[Images]?
    
    enum CodingKeys: String, CodingKey {
        case collection
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse collection
        let collectionContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .collection)
        
        self.items = try collectionContainer.decode([Images].self, forKey: .items)
    }
}
