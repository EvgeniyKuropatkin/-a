//
//  CityCardView.swift
//  `a
//
//  Created by 1111 on 13.09.2025.
//

import SwiftUI

struct CityCardView: View {
    let cityCard: CityCard
    
    var body: some View {
        ZStack {
            HStack{
                VStack{
                    Text(cityCard.name)
                        .foregroundColor(.yellow)
                        .padding(5)
                    Text(cityCard.temperature)
                        .foregroundColor(.yellow)
                        .padding(5)
                    Text(cityCard.ShortWeather)
                        .foregroundColor(.yellow)
                        .padding(5)
                    
                }
                Image(cityCard.icon)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
            .overlay(alignment: .topTrailing){
                Button{
                   //?
                }
                label:{
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(5)
                }
            }
            .background(Color.black)
            .cornerRadius(10)
        }
    }
}

#Preview {
    CityCardView(cityCard:cityCard1)
    
}
