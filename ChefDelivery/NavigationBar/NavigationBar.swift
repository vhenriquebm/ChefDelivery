//
//  HeaderView.swift
//  ChefDelivery
//
//  Created by Vitor Henrique Barreiro Marinho on 29/10/24.
//

import SwiftUI

struct NavigationBar: View {
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            
            Button("R. Vergueiro, 3185") {
                print ("Something")
            }
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .font(.subheadline)
            
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell.badge")
                    .foregroundStyle(Color.red)
                    .padding(.horizontal)
                    .font(.title3)
            }
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
