//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 27/11/24.
//

import Foundation

enum RequestError: Error {
    case invalidUrl
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType], RequestError > {
        let urlString = "https://private-47b12-vitor13.apiary-mock.com/home"
        
        guard let url = URL(string: urlString) else {
            return .failure(RequestError.invalidUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let stores = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(stores)
    }
}
