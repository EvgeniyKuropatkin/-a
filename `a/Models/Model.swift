//
//  Model.swift
//  `a
//
//  Created by 1111 on 30.09.2025.
//
import Foundation
///Эта структура декодируется из JSON-ответа погодного API
struct Welcome: Codable {
    ///Код статуса ответа.
    let cod: String
    ///Дополнительное сообщение от сервера.
    let message: Double
    ///Количество элементов прогноза в массиве `list`
    let cnt: Int
    ///Список прогнозов погоды, упорядоченных по времени.
    let list: [List]
    ///Информация о городе, для которого запрошен прогноз.
    let city: City
}

///Структура для описания города
struct City: Codable {
    ///Идентефикационный номер
    let id: Int
    ///Название города
    let name: String
    ///Координаты города
    let coord: Coord
    ///Страна в которой находится город
    let country: String
    ///Примерное количество населения
    let population: Int
}

///Структура для описания координат нахождения города на карте
struct Coord: Codable {
    ///Широта и долгота нахождения города
    let lat, lon: Double
}

///Структура списка прогнозов погоды, упорядоченных по времени.
struct List: Codable {
    ///Дата и время
    let dt: Int
    ///Информация об основных метеорологических показателей
    let main: Main
    ///Информация о погоде
    let weather: [Weather]
    ///Информация об облачности
    let clouds: Clouds
    ///Информация о ветре
    let wind: Wind
    ///Информация о части суток
    let sys: Sys
    ///Дата и время
    let dtTxt: String
    ///Информация о б осадках
    let rain: Rain?
    /// Ключи декодирования JSON-ответа от OpenWeatherMap API.
    enum CodingKeys: String, CodingKey {
        /// Временная метка данных в формате Unix
        case dt
        /// Основные метеорологические данные
        case main
        /// Массив описаний погодных условий
        case weather
        /// Информация об облачности
        case clouds
        /// Данные о ветре
        case wind
        /// Часть суток
        case sys
        /// Время прогноза в читаемом формате
        case dtTxt = "dt_txt"
        /// Информация об осадках
        case rain
    }
}

///Структура описания облачности
struct Clouds: Codable {
    ///Процент облачности в процентах
    let all: Int
}
///Структура основных метеорологических показателей
struct Main: Codable {
    ///Текущая температура в Кельвинах
    ///Минимальная и максимальная температура в Кельвинах за прошедший час
    ///Атмосферное давление в гПа
    let temp, tempMin, tempMax, pressure: Double
    ///Атмосферное давление на уровне моря
    ///Атмосферное давление на уровне земли
    let seaLevel, grndLevel: Double
    ///влажность в текущий момент времени
    let humidity: Int
    ///Темпетарутный коэффициент в Кельвинах (Дневная - ночная температура)
    let tempKf: Double
    /// Ключи декодирования JSON-ответа от OpenWeatherMap API.
    enum CodingKeys: String, CodingKey {
        /// Текущая температура.
        case temp
        /// Минимальная температура
        case tempMin = "temp_min"
        /// Максимальная температура
        case tempMax = "temp_max"
        /// Атмосферное давление.
        case pressure
        /// Давление на уровне моря
        case seaLevel = "sea_level"
        /// Давление на уровне земли
        case grndLevel = "grnd_level"
        /// Относительная влажность в процентах
        case humidity
        /// Температурный коэффициент - разница между днём и ночью
        case tempKf = "temp_kf"

    }
}

///Структура информации об осадках
struct Rain: Codable {
}

///Системная информация о погоде
struct Sys: Codable {
    ///Часть суток: "d" - день   "n" ночь
    let pod: String
}

///Структура описания погодных условий
struct Weather: Codable {
    ///Идентификатор погодного состояния
    let id: Int
    ///Погодные условия, описание погоды, код иконки для описания погодных условий
    let main, description, icon: String
}

///Структура описывающая подробности о ветре
struct Wind: Codable {
    ///Скорость, направление и порывы ветра
    let speed, deg, gust: Double
}
