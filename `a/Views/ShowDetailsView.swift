//
//  showDetailsView.swift
//  `a
//
//  Created by 1111 on 16.09.2025.
//

import SwiftUI


struct ShowDetailsView: View {
    
    let cityCard: CityCard
    @State private var whichForecast: Bool = false
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            VStack{
                Button(
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label:{
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                            .padding(5)
                    }
                )
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                
                Text(cityCard.name)
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: .infinity)
                }
            
            VStack(alignment: .center, spacing: 20){
                Text("\(cityCard.date)")
                
                Text("\(cityCard.temperature)")
                    .font(.title)
                
                HStack{
                    Image(systemName: "arrow.down")
                    
                    Text("min")
                    
                    Text("\(cityCard.temperatureMin)")
                    .padding(.trailing, 20.0)
                    
                    Image(systemName: "arrow.up")
                    
                    Text("max")
                    
                    Text("\(cityCard.temperatureMax)")
                }
                
                Image(cityCard.icon)
                    .resizable()
                    .frame(width: 170, height: 150)
                
                Text("\(cityCard.ShortWeather)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                HStack{
                    Image("wind")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("\(cityCard.wind)")
                        .padding(.trailing, 20.0)
                    
                    Image("humidity")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("\(cityCard.humidity)"+"%")
                }
                
                Picker("Тип прогноза", selection: $whichForecast) {
                    Text("Почасовой прогноз")
                        .tag(false)
                    
                    Text("Прогноз на 7 дней")
                        .tag(true)
                }
                .pickerStyle(.segmented)
                    
                if whichForecast {
                    DailyForecast()
                } else {
                    HourlyForecast()
                }
            }
        }
        .background(Image("backgroundForApp"))
    }
}

#Preview {
    ShowDetailsView(
        cityCard: CityCard(name: "Нью-Йорк",
                temperature: "15.0"+" °C",
                icon: "cloud.rain",
                ShortWeather: "Дождь",
                temperatureMin: "15.0"+" °C",
                temperatureMax: "35.0"+" °C",
                wind: "6 м/с",
                humidity: 40,
                date: "15.09.2025" ))
}
