//
//  NetworkManager.swift
//  `a
//
//  Created by 1111 on 30.09.2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "d5f8af7831dbd10890d036582b0d6628"
    let decoder = JSONDecoder()
    
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getWeather(for SearchCity:String) async throws -> Welcome{
        let urlWeather = "https://api.openweathermap.org/data/2.5/forecast?q=\(SearchCity)&appid=\(apiKey)&units=metric"
        
        
        guard let url = URL(string: urlWeather) else {throw NetworkError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        do{
            return try decoder.decode(Welcome.self, from: data)
        }
        catch{
            throw NetworkError.invadidData
        }
    }
}
enum NetworkError: String, Error{
    case invalidURL = "InvalidURL"
    case invalidResponse = "InvalidResponse"
    case invadidData = "InvalidData"
}
