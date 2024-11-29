//
//  SearchStoreViewModel.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 28/11/24.
//

import Foundation

class SearchStoreViewModel: ObservableObject {
    
    // MARK: - Attributes
    
    let service: SearchService
    @Published var storesType: [RestaurantSearch] = []
    @Published var searchText: String = ""
    
    init(service: SearchService) {
        self.service = service
        fetchData()
    }
    
    // MARK: - Class methods
    
    func fetchData() {
        Task {
            do {
                let result = try await service.fetchData()
                switch result {
                case .success(let stores):
                    self.storesType = stores
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func filteredStores() -> [RestaurantSearch] {
        if searchText.isEmpty {
            return storesType
        }
        return storesType.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
}

