//
//  JData.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/11/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct JData : Decodable {
    
    var description:String?
    var title:String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case title
    }
    
    init(from decoder: Decoder) throws {
        
        // Create a container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse title
        self.title = try container.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try container.decode(String.self, forKey: .description)
    }
}
