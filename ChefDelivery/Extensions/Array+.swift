//
//  Array+.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 04/12/24.
//

import Foundation

extension Array: Searchable where Element == String {
    func matches(query: String) -> Bool {
        return contains(where: { $0.lowercased().hasPrefix(query)})
    }
}
