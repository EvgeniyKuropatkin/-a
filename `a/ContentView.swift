//
//  ContentView.swift
//  `a
//
//  Created by 1111 on 04.09.2025.
//

import SwiftUI




struct ContentView: View {
    
    @State private var SearchCity = ""
    let cityCardList = [ CityCard(name: "Москва", temperature: "25.0"+" °C", icon: "sun.max", ShortWeather: "Солнечно"),
    CityCard(name: "Нью-Йорк", temperature: "15.0"+" °C", icon: "cloud.moon.fill", ShortWeather: "Облачно")]
    
    var body: some View {
        VStack{
            TextField("Search", text: $SearchCity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal,10)
                .padding(.top,10)
                .padding(.bottom,10)
        
        
            ScrollView(.vertical, showsIndicators: false){
                ForEach(cityCardList, id: \.self) { elem in
                    
                    CityCardView(cityCard:elem)
                }
                .padding(.horizontal,20)
            }
        }
    }
}

#Preview {
    ContentView()
}
