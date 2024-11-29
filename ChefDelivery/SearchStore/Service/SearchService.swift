//
//  SearchService.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 28/11/24.
//

import Foundation

struct SearchService {
    
    func fetchData() async throws -> Result<[RestaurantSearch], RequestError> {
        guard let url = URL(string: "https://private-47b12-vitor13.apiary-mock.com/search") else {
            return .failure(.invalidUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("DEBUG - RAW DATA: \(String(data: data, encoding: .utf8) ?? "No data")")

        
        let storesObjects = try JSONDecoder().decode([RestaurantSearch].self, from: data)
        
        print ("DEBUG - DATA \(data)")
        print ("DEBUG - STORES \(storesObjects)")

        
        return .success(storesObjects)
    }
}
