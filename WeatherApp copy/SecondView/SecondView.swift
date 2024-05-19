//
//  SecondView.swift
//  WeatherApp
//
//  Created by Anas Salah on 18/05/2024.
//

import SwiftUI

struct SecondView: View {
    
    var date = "Now"
    var image = "⛅️"
    var degree = "22°"
    
    var rowNumber: Int = 6
    
   // var current = Current(from: )
    
    var body: some View {
        List {
            HStack{
                Text(date)
                Spacer()
                Text(image)
                Spacer()
                Text("\(rowNumber)")
            }
            .padding()
            .listRowBackground(Color.clear)

        }
        .background(Color.clear)
        .scrollContentBackground(.hidden)
        .background(
            Image("Day")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        ).padding()

    }
}

#Preview {
    SecondView(rowNumber: 0)
}
