//
//  CityCard.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import Foundation

struct CityCard: Hashable, Identifiable {
    // TODO: Нужно сделать документацию
    let id = UUID()
    var name: String
    var temperature: String
    var icon: String
    var ShortWeather: String
    var temperatureMin: String
    var temperatureMax: String
    var wind: String
    var humidity: Int
    var date: String
}

