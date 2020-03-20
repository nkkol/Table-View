//
//  ToDecode.swift
//  Table View
//
//  Created by Inna Litvinenko on 3/21/20.
//  Copyright © 2020 Inna Litvinenko. All rights reserved.
//

import Foundation

class ToDecode: Decodable {
    
    let companies: [String]
    
    enum CodingKeys: String, CodingKey {
        case companies
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companies = try container.decode([String].self, forKey: .companies)
    }
}
