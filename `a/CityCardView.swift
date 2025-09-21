//
//  CityCardView.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import SwiftUI

struct CityCardView: View {
    let cityCard: CityCard
    @State private var showDetails = false;
    @State private var showCityCard = true;
    
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(cityCard.name)
                        .foregroundColor(.yellow)
                    Text(cityCard.temperature)
                        .foregroundColor(.yellow)
                    Text(cityCard.ShortWeather)
                        .foregroundColor(.yellow)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(cityCard.icon)
                    .scaledToFit()
                    .padding()
            }
            .overlay(alignment: .topTrailing){
                Button{
                    self.showCityCard.toggle()//???
                    
                }
                label:{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(5)
                }
            }
            Button(action: {
                self.showDetails.toggle();
            }, label: {Text("Детали")})
            .sheet(isPresented: $showDetails){
                showDetailsView(cityCard:cityCard)
            }
            
        }
            .background(Color.black)
            .cornerRadius(10)
        
    }
}

#Preview {
    CityCardView(cityCard: CityCard(name: "Нью-Йорк", temperature: "15.0"+" °C", icon: "cloud.moon.fill", ShortWeather: "Облачно",temperatureMin: "15.0"+" °C", temperatureMax: "35.0"+" °C", timeSunUp: "6:05", timeSunDown: "21:15", date: "15.09.2025" ))
}
