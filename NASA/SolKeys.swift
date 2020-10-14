//
//  SolKeys.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/13/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct SolKeys : Decodable {
    
    var sol_keys = [String]()
    
    enum CodingKeys: String, CodingKey {
        
        case sol_keys
    }
    
    init(from decoder: Decoder) throws {
        
        // Create outer container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse sol_keys
        self.sol_keys = try container.decode([String].self, forKey: .sol_keys)
    }
}
