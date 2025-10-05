//
//  ContentView.swift
//  `a
//
//  Created by 1111 on 04.09.2025.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    var firstSearch = "Москва"
    var secondSearch = "Ростов-на-Дону"
    
    @State private var SearchCity = ""
    @State private var cityCards: [CityCard] = []
    @State private var errorMessage: String?
    
    var body: some View {

        VStack {
            TextField("Поиск", text: $SearchCity, onCommit: {
                addCity(named: SearchCity)
                SearchCity = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .onAppear {
                addCity(named: firstSearch)
                addCity(named: secondSearch)
            }
            
            ScrollView {
                ForEach(cityCards) { card in
                    CityCardView(cityCard: card) {
                        cityCards.removeAll { $0.id == card.id }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(Image("backgroundForApp"))
        .alert("Ошибка", isPresented: .constant(errorMessage != nil)) {
            Button("OK") { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "Неизвестная ошибка")
        }

    }
        
    
    private func addCity(named cityName: String) {
        Task {
            do {
                let forecastResponse = try await NetworkManager.shared.getWeather(for: cityName)
                
                guard let firstItem = forecastResponse.list.first else { return }
                
                let newCard = CityCard(
                    name: forecastResponse.city.name,
                    temperature: String(format: "%.0f°C", firstItem.main.temp),
                    icon: mapIcon(firstItem.weather.first?.icon ?? "01d"),
                    ShortWeather: firstItem.weather.first?.main ?? "Погода",
                    temperatureMin: String(format: "%.0f°C", firstItem.main.tempMin),
                    temperatureMax: String(format: "%.0f°C", firstItem.main.tempMax),
                    wind: String(format: "%.0f м/с", firstItem.wind.speed),
                    
                    humidity: Int(firstItem.main.humidity),
                    date: formatDate(firstItem.dtTxt)
                    
                )
                
                await MainActor.run {
                    if !cityCards.contains(where: { $0.name == newCard.name }) {
                        cityCards.append(newCard)
                    }
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Город не найден"
                }
            }
            
        }

    }
    
    
    private func formatDate(_ dateString: String) -> String {
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
    
    private func mapIcon(_ code: String) -> String {
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

}

#Preview {
    ContentView()
}
