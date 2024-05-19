//
//  ListOfHome.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI

struct ListOfHome: View {
    var body: some View {
            List {
                Section(header: Text("3-DAY FORECAST")
                    .font(.headline)
                    .foregroundColor(.black)) {
                        ForEach(0..<3) { item in
                            NavigationLink(destination: SecondView(rowNumber: item)) {
                                CellOfHomeList()
                                    .listRowBackground(Color.clear)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.black), alignment: .top
                                    )
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
            }.scrollDisabled(true)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
    }
}


#Preview {
    ListOfHome()
}
