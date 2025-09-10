//
//  ContentView.swift
//  `a
//
//  Created by 1111 on 04.09.2025.
//

import SwiftUI




struct ContentView: View {
    
    @State private var SearchCity = ""
    
    var body: some View {
        VStack{
            TextField("Search", text: $SearchCity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal,10)
        }
        
        List{
            CityCardView(cityCard:cityCard1)
            CityCardView(cityCard:cityCard2)
        }
    }
}

#Preview {
    ContentView()
}
