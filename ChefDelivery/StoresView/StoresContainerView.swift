//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 08/11/24.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading,
                   spacing: 30 ,
                   content: {
                ForEach(storesMock) { mock in
                    StoreItemView(order: mock)
                }
            })
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
}
