//
//  ContentView.swift
//  sui-weather
//
//  Created by Egor Tushev on 12.05.2024.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Москва, Россия")
                
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: 28)
                
                LazyHStack(spacing: 10) {
                    ForEach(viewModel.days, id:\.day) { WeatherDayView(weather: $0) }
                }
                
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Изменить время дня",
                                  textColor: .white,
                                  backgroundColor: .mint)
                }
                
                Spacer()
            }
        }.onAppear {
            viewModel.fetchWeather()
        }
    }
}

#Preview {
    ContentView()
}

private struct WeatherDayView: View {
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    private let weather: Weather
    
    var body: some View {
        VStack {
            Text(weather.day)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
            KFImage(URL(string: weather.imageName))
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            Text("\(weather.temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

private struct BackgroundView: View {
    
    fileprivate var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

private struct CityTextView: View {
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    private let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

private struct WeatherStatusView: View {
    
    init(imageName: String, temperature: Int) {
        self.imageName = imageName
        self.temperature = temperature
    }
    
    private let imageName: String
    private let temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
