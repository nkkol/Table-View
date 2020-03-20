//
//  APIClient.swift
//  Table View
//
//  Created by Inna Litvinenko on 3/21/20.
//  Copyright © 2020 Inna Litvinenko. All rights reserved.
//

import Foundation

struct ApiClient {
    
    let responseType: ResponceType
    var companiesNames : [String]
    
    enum ResponceType {
        case success
        case networkError
    }
    
    mutating func fetchCompanies() {
        
        guard let file = Bundle.main.path(forResource: getFile(), ofType: "json"),
       // guard let file = Bundle.main.path(forResource: "Companies", ofType: "json"),
        let data = try? Data(contentsOf: URL (fileURLWithPath: file), options: []),
            let names = try? JSONDecoder().decode(ToDecode.self, from: data)
            else {return}
        
        companiesNames = names.companies
    }
 
}

