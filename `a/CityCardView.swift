//
//  CityCardView.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import SwiftUI

struct CityCardView: View {
    
    let cityCard: CityCard
    
    let onDelete: (() -> Void)
    @State private var showDetails = false;
    @State private var showCityCard = true;
    
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(cityCard.name)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    Text(cityCard.temperature)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    Text(cityCard.ShortWeather)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    
                    Button(action: {
                        self.showDetails.toggle();
                    }, label: {Text("Подробнее")
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)})
                    .sheet(isPresented: $showDetails){
                        showDetailsView(cityCard:cityCard)
                    }                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Image(cityCard.icon)
                    .scaledToFit()
                    .padding()
            }
            .overlay(alignment: .topTrailing){
                Button{
                    onDelete()
                }
                label:{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(5)
                }
            }

            
        }
            .cornerRadius(10)
            .background(
                .ultraThinMaterial
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        
    }
}

#Preview {
    CityCardView(cityCard: CityCard(
        name: "Нью-Йорк",
        temperature: "15.0 °C",
        icon: "cloud.rain",
        ShortWeather: "Облачно",
        temperatureMin: "15.0 °C",
        temperatureMax: "35.0 °C",
        wind: "15 м/с",
        humidity: 40,
        date: "15.09.2025"
    )) {
        // Пустое замыкание для preview
        print("Удаление в preview")
    }
}
