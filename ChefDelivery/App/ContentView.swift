//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    
    @State private var stores: [StoreType] = []
    @State private var isLoading = true
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: stores)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    private func getStores() async {
        
        do {
            let result = try await service.fetchData()
            
            switch result {
            case .success(let stores):
                self.stores = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            print(error)
            self.isLoading = false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
