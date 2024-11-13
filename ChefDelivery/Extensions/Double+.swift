//
//  Double+.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 13/11/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formatted = String(format: "%.2f", self)
        return formatted.replacingOccurrences(of: ".", with: ",")
    }
}
