//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 08/11/24.
//

import Foundation

protocol Searchable {
    func matches(query: String) -> Bool
}

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoImage: String?
    let headerImage: String?
    let location: String
    let stars: Int
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location,stars, products
        case logoImage = "logo_image"
        case headerImage = "header_image"
       
    }
}

struct RestaurantSearch: Codable {
    let id: Int
    let name: String
    let location: String
    let stars: Int
    let specialties: [String]?
}

extension RestaurantSearch: Searchable {
    
    func matches(query: String) -> Bool {
        guard let specialities = specialties else { return false }
        let parameters: [Searchable] = [name, specialities]
        
        return parameters.contains(where: { $0.matches(query: query.lowercased()) })
    }
}
