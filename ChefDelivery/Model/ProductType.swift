//
//  Product.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 08/11/24.
//

import Foundation

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
