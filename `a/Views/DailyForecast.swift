//
//  dailyForecast.swift
//  `a
//
//  Created by 1111 on 26.09.2025.
//

import SwiftUI
///Структура для описания прогноза погоды на 7 дней
struct DailyForecast: View {
    ///список данных
    let DailyForecastList=[DailyForecastStruct(day: "13.05",temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "14.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "15.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "16.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "17.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "18.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "19.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "20.05", temperature: "15°C", icon: "sun.max"),
                           DailyForecastStruct(day: "21.05", temperature: "15°C", icon: "sun.max")]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(DailyForecastList, id: \.self) { elem in
                        
                        VStack{
                            Text(elem.day)
                            Image(elem.icon)
                            Text(elem.temperature)
                        }
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(.white.opacity(0.2), lineWidth: 1))
            .shadow(color: .black.opacity(0.1),
                    radius: 10, x: 0, y: 4)
            .cornerRadius(20)
        }
        
    }
}

#Preview {
    DailyForecast()
}
