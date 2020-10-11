//
//  Links.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/11/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Links : Decodable {
    
    var href = ""
    
    enum CodingKeys: String, CodingKey {
        case href
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse href
        self.href = try container.decode(String.self, forKey: .href)
    }
}
