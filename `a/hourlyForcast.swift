//
//  hourlyForcast.swift
//  `a
//
//  Created by 1111 on 21.09.2025.
//

import SwiftUI

struct hourlyForcast: View {
    
    let hourlyForcastList=[hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"),hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"),hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max"), hourlyForcaststruct(time: "13:00", temperature: "15°C", icon: "sun.max")]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(hourlyForcastList, id: \.self) { elem in
                        
                        VStack{
                            Text(elem.time)
                            Image(elem.icon)
                            Text(elem.temperature)
                        }
                    }
                
            }.padding()
                .background(Color.gray)
                .cornerRadius(20)
        }
    }
}

#Preview {
    hourlyForcast()
}
