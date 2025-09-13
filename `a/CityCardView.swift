//
//  CityCardView.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import SwiftUI

struct CityCardView: View {
    let cityCard: CityCard
    
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(cityCard.name)
                        .foregroundColor(.yellow)
                        //.padding(5)
                    Text(cityCard.temperature)
                        .foregroundColor(.yellow)
                        //.padding(5)
                    Text(cityCard.ShortWeather)
                        .foregroundColor(.yellow)
                        //.padding(5)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(cityCard.icon)
                    .scaledToFit()
                    .padding()
            }
            .overlay(alignment: .topTrailing){
                Button{
                    //?
                }
                label:{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(5)
                }
            }
            Button(action: {}, label: {Text("Детали")})
        }
            .background(Color.black)
            .cornerRadius(10)
        
    }
}

#Preview {
    CityCardView(cityCard: CityCard(name: "Нью-Йорк", temperature: "15.0"+" °C", icon: "cloud.moon.fill", ShortWeather: "Облачно"))
}
