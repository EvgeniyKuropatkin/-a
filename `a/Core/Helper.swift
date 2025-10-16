//
//  Helper.swift
//  `a
//
//  Created by 1111 on 16.10.2025.
//

import Foundation


///Открытая функция для форматирования даты в строку
func formatDate(_ dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        return outputFormatter.string(from: date)
    }
    return "—"
}
///Открытая функция для преобразования кода погоды в соответствующую этому коду иконку
func mapIcon(_ code: String) -> String {
    switch code.prefix(2) {
    case "01": return "sun.max"
    case "02": return "cloud.sun"
    case "03", "04": return "cloud"
    case "09", "10": return "cloud.rain"
    case "11": return "bolt"
    case "13": return "snow"
    default: return "cloud"
    }
}
