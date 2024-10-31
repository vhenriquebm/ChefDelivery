//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 31/10/24.
//

import SwiftUI

struct CarouselTabView: View {
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "", image: "barbecue-banner"),
        OrderType(id: 2, name: "", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
            }
        }.frame(height: 180)
            .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
