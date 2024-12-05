//
//  String+.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 04/12/24.
//

import Foundation

extension String: Searchable {
    func matches(query: String) -> Bool {
        return lowercased().hasPrefix(query)
    }
}
