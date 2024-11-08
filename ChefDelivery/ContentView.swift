//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            NavigationBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                    StoresContainerView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
