//
//  CellOfHomeList.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI

struct CellOfHomeList: View {
    var body: some View {
        
        HStack {
            Text("Today")
            Spacer()
            Text("☁️")
            Spacer()
            Text("7.8^-15.5")
        }
        .shadow(radius: 2)
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    CellOfHomeList()
}
