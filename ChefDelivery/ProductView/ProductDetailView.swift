//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 21/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    
    @State private var productQuantity = 1
    
    var service = HomeService()
    
    
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: productQuantity)
            
            Spacer()
            
            ProductDetailButtonView(onButtonTapped: {
                Task {
                    await self.confirmOrder()
                }
            })
        }
    }
    
    private func confirmOrder() async {
        
        do {
            let result = try await service.confirmOrder(with: product)
            
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error)
            }
            
        } catch {
            print(error)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    
    var onButtonTapped: () -> Void
    
    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Enviar o pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundStyle(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}
