//
//  API.swift
//  Dodo
//
//  Created by dreamlogin on 17.03.2025.
//

import Foundation

enum API {
    static let baseURL = "http://localhost:3000"
    
    enum Endpoint: String {
        case categories = "/categories"
        case products = "/products"
        case banners = "/banners"
        case stories = "/stories"
        case ingredients = "/ingredients"
        
        var url: URL {
            URL(string: "\(baseURL)" + self.rawValue)!
        }
    }
}
