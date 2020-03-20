//
//  URLSession.swift
//  Table View
//
//  Created by Inna Litvinenko on 3/21/20.
//  Copyright © 2020 Inna Litvinenko. All rights reserved.
//

import Foundation

var jsonString: String = ""

func getFile () -> String {
    if let url = URL(string: "https://api.myjson.com/bins/vi56v") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
             if let str = String(data: data, encoding: .utf8) {
                jsonString = str
                print(jsonString)
            }
           }
       }.resume()
    }
    return jsonString
}
