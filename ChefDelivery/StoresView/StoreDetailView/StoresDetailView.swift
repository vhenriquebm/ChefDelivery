//
//  StoresDetailView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 08/11/24.
//

import SwiftUI

struct StoresDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(products: store.products)
                
            }
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "cart")
                        Text("Lojas")
                    }
                    .foregroundStyle(Color("ColorRed"))
                }
            }
        }
    }
}


#Preview {
    StoresDetailView(store: storesMock[0])
}
