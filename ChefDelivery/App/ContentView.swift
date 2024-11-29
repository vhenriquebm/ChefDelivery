//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 29/10/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true
    @State private var searchText = ""
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    if isLoading {
                        ProgressView()
                    } else {
                        NavigationBar()
                            .padding(.horizontal, 15)

                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 20) {
                                OrderTypeGridView()
                                CarouselTabView()
                                StoresContainerView(stores: storesType)
                            }
                        }
                        Spacer()
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
                
                SearchStoreView(viewModel: SearchStoreViewModel(service: SearchService()))
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Busca")
                    }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    // MARK: - Methods
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
            
        } catch {
            print(error.localizedDescription)
            self.isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
