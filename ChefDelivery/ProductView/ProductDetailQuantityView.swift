//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 23/11/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @State private var productQuantity = 1

    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                
            }
                
        }
    }
}

#Preview {
    ProductDetailQuantityView()
}
