//
//  dailyForecast.swift
//  `a
//
//  Created by 1111 on 26.09.2025.
//

import SwiftUI

struct dailyForecast: View {
    
    // TODO: сделай читаемо
    let dailyForecastList=[dailyForecastStruct(day: "13.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "14.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "15.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "16.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "17.05", temperature: "15°C", icon: "sun.max"),dailyForecastStruct(day: "18.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "19.05", temperature: "15°C", icon: "sun.max"),dailyForecastStruct(day: "20.05", temperature: "15°C", icon: "sun.max"), dailyForecastStruct(day: "21.05", temperature: "15°C", icon: "sun.max")]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(dailyForecastList, id: \.self) { elem in
                        
                        VStack{
                            Text(elem.day)
                            Image(elem.icon)
                            Text(elem.temperature)
                        }
                    }
                    
                    // TODO: сделай читаемо
            }.padding()
                    .background(
                                // Основа: материал с размытием
                                .ultraThinMaterial // или .thinMaterial, .regularMaterial
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                // Добавляем тонкую границу для "стеклянного" блеска
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white.opacity(0.2), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
                .cornerRadius(20)
        }
        
    }
}

#Preview {
    dailyForecast()
}
