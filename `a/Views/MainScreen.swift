//
//  ContentView.swift
//  `a
//
//  Created by 1111 on 04.09.2025.
//

// ContentView.swift
import SwiftUI
///Структура предназначенная для показа первого экрана, содержащего 2 города искомых по умолчанию и поле поиска нового города
struct MainScreen: View {
    ///Переменная для нахождения первого города по умолчанияю
    let firstSearch = "Москва"
    ///Переменная для нахождения второго города по умолчанияю
    let secondSearch = "Ростов-на-Дону"
    ///Переменная предназначенная для поиска нового города
    @State private var SearchCity = ""
    ///Список городов которые отображаются на экране
    @State private var cityCards: [CityCard] = []
    ///Переменная для выдачи ошибки, о ненахождении искомого города
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
    ///Функция добавления города в список городов cityCards
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

}

#Preview {
    MainScreen()
}
