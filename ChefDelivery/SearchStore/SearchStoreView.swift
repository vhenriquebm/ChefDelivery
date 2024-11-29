//
//  SearchStoreView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 28/11/24.
//

import SwiftUI

struct SearchStoreView: View {
    
    @ObservedObject var viewModel: SearchStoreViewModel
    
    // MARK: - Views
    
    var searchTextView: some View {
        HStack {
            TextField("Pesquisar em Chef Delivery", text: $viewModel.searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button {
                viewModel.searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .padding(.top, 8)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    searchTextView
                        .listRowSeparator(.hidden)
                    
                    ForEach(viewModel.filteredStores(), id: \.id) { store in
                        Text(store.name)
                            .font(.custom("Futura", size: 16))
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                }
                .padding(.top, 15)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                
                Spacer()
            }
        }
    }
}
