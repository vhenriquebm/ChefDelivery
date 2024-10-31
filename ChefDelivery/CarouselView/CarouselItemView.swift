//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 31/10/24.
//

import SwiftUI

struct CarouselItemView: View {
    let order: OrderType
    
    var body: some View {
        
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: "", image: "barbecue-banner"))
}
