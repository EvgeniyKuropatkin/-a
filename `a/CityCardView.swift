//
//  CityCardView.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import SwiftUI

struct CityCardView: View {
    
    // TODO: Документация
    let cityCard: CityCard
    
    // MARK: Тут можно без лишних скобок, было: let onDelete: (() -> Void)
    let onDelete: () -> Void
    @State private var showDetails = false;
    @State private var showCityCard = true;
    
    var body: some View {
        ZStack {
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    
//                        Text(cityCard.name)
//                            .foregroundColor(.blue)
//                            .fontWeight(.heavy)
//                        Text(cityCard.temperature)
//                            .foregroundColor(.blue)
//                            .fontWeight(.heavy)
//                        Text(cityCard.ShortWeather)
//                            .foregroundColor(.blue)
//                            .fontWeight(.heavy)
                    
                    // TODO: Сделай разделение между структурами во всех структурах(View), вот так:
                    Text(cityCard.name)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    
                    Text(cityCard.temperature)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    
                    Text(cityCard.ShortWeather)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)
                    
//                    Button(action: {
//                        self.showDetails.toggle();
//                    }, label: {Text("Подробнее")
//                        .fontWeight(.heavy)
//                        .foregroundColor(.blue)
//                        .frame(maxWidth: .infinity, alignment: .trailing)})
//                    .sheet(isPresented: $showDetails){
//                        showDetailsView(cityCard:cityCard)
//                    }
                    // TODO: нечитаемо, переделай примерно вот так, мне, например, легче
                    Button(
                        action: {
                            
                            // MARK: self не обязательно, это используется когда у тебя определена такая же переменная(название), и тебе нужно обратиться к переменной в струкруре
                            self.showDetails.toggle()
                        }, label: {
                            Text("Подробнее")
                                .fontWeight(.heavy)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    )
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
                // MARK: тут не нужно переносить на другую строку, обычно пишут в одной строке
                .ultraThinMaterial
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                
                    // MARK: модификаторы на tab делай, чтоб было читаемо
                RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.2), lineWidth: 1)
            )
        // MARK: Вот тут можно color и radius разнести на разные строки, чтобы было читаемо
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        
    }
}

#Preview {
//    CityCardView(cityCard: CityCard(
//        name: "Нью-Йорк",
//        temperature: "15.0 °C",
//        icon: "cloud.rain",
//        ShortWeather: "Облачно",
//        temperatureMin: "15.0 °C",
//        temperatureMax: "35.0 °C",
//        wind: "15 м/с",
//        humidity: 40,
//        date: "15.09.2025"
//    )) {
//        // Пустое замыкание для preview
//        print("Удаление в preview")
//    }
    // MARK: Тут можно так
    CityCardView(
        cityCard: CityCard(
            name: "Нью-Йорк",
            temperature: "15.0 °C",
            icon: "cloud.rain",
            ShortWeather: "Облачно",
            temperatureMin: "15.0 °C",
            temperatureMax: "35.0 °C",
            wind: "15 м/с",
            humidity: 40,
            date: "15.09.2025"
        ),
        onDelete: { }
    )
}
