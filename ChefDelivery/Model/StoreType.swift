//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 08/11/24.
//

import Foundation

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
    let specialties: [String]
}


