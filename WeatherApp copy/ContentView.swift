//
//  ContentView.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI
import Alamofire
import MapKit



struct ContentView: View {
    
    var state = "Day"
    @State var cityName: String?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var weatherResponse: WeatherResponse = WeatherResponse(location: Location(name: "Cairo", region: "", country: "Egypt", lat: 30.0444, lon: 31.2357, tzID: "", localtimeEpoch: 1621183200, localtime: "2024-05-16 20:20"), current: Current(lastUpdatedEpoch: 1621183200, lastUpdated: "2024-05-16 20:20", tempC: 20, tempF: 68.0, isDay: 1, condition: Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 113), windMph: 9.8, windKph: 15.8, windDegree: 200, windDir: "SSW", pressureMB: 1016, pressureIn: 30.0, precipMm: 0, precipIn: 0, humidity: 50, cloud: 0, feelslikeC: 20, feelslikeF: 68.0, visKM: 10, visMiles: 6, uv: 6, gustMph: 12.1, gustKph: 19.4))

    
    var body: some View {
        NavigationView{
            
            VStack {
                Text(cityName ?? "Cairo")
                    .font(.system(size: 48))
                Text("21^")
                    .font(.system(size: 40))
                Text("Partly Cloudy")
                    .font(.system(size: 32))
                
                HStack {
                    Text("H: 16°")
                    Text("      ") // finde real way to do it
                    Text("L: 16°")
                }
                
                Text("⛅️")
                    .font(.system(size: 50))
                    .shadow(radius: 10)
                //NavigationLink(destination: SecondView()) {
                ListOfHome()
                //}
                LazyVGrid(columns: columns, spacing: 16) {
                    WeatherDetailRow(title: "Visibility", value: "\(weatherResponse.current.visKM) KM")
                    
                    WeatherDetailRow(title: "Humidity", value: "\(weatherResponse.current.humidity)%")
                    
                    WeatherDetailRow(title: "Feels Like", value: "\(weatherResponse.current.feelslikeC)°")
                    
                    WeatherDetailRow(title: "Pressure", value: "\(weatherResponse.current.pressureMB) MB")
                    
                }
                .padding()
                
            }
            .background(
                Image("Day")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .padding()
            .onAppear {
                Task {
                    await fetchWeather()
                }
            }
        }
    }
    
    //MARK: HelperMethod
    
    func fetchWeather() async {
        let request = AF.request("https://api.weatherapi.com/v1/current.json?key=e28ecca6437c4873b2c140547241605&q=30.078789494,31.098451616&aqi=no")
        
        request.responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case.success(let weather):
                //dump(weather)
                weatherResponse = weather
                cityName = weather.location.name
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



struct WeatherDetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
            Text(value)
                .font(.title)
        }
        .padding(.horizontal)
    }
}







#Preview {
    ContentView()
}

/*
    VISIBILTY              HUMDITY
        10KM                 36%
 
    FEELS LIKE             PRESSURE
        16^                  1.021
 */
