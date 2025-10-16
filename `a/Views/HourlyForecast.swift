//
//  hourlyForcast.swift
//  `a
//
//  Created by 1111 on 21.09.2025.
//

import SwiftUI
///Структура для описания почасового прогноза погоды
struct HourlyForecast: View {
    ///Список данных
    let HourlyForecastList=[HourlyForecastStruct(time: "13:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "14:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "15:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "16:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "17:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "18:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "19:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "20:00", temperature: "15°C", icon: "sun.max"),
                            HourlyForecastStruct(time: "21:00", temperature: "15°C", icon: "sun.max")]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(HourlyForecastList, id: \.self) { elem in
                        
                        VStack{
                            Text(elem.time)
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
    HourlyForecast()
}
