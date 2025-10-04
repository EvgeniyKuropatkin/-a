//
//  showDetailsView.swift
//  `a
//
//  Created by 1111 on 16.09.2025.
//

import SwiftUI



struct showDetailsView: View {
    
    let cityCard: CityCard
    @State private var whichForcast = false;
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            VStack{
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }
                label:{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.black)
                        .padding(5)
                }
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
                    Text("\(cityCard.timeSunUp)")
                    Image("humidity")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(cityCard.timeSunDown)")
                }
                VStack{
                    HStack{
                        Button(action: {
                            self.whichForcast=false;
                        }, label: {Text("Почасовой прогноз")})
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        Button(action: {
                            self.whichForcast=true;
                        }, label: {Text("Прогноз на 7 дней")})
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                    }
                    switch whichForcast {
                    case false:
                        hourlyForecast()
                    case true:
                        dailyForecast()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        }
        .background(Image("backgroundForApp"))
    }
}

#Preview {
    showDetailsView(cityCard: CityCard(name: "Нью-Йорк", temperature: "15.0"+" °C", icon: "cloud.moon.fill", ShortWeather: "Облачно",temperatureMin: "15.0"+" °C", temperatureMax: "35.0"+" °C", timeSunUp: "6:05", timeSunDown: "21:15", date: "15.09.2025" ))
}
