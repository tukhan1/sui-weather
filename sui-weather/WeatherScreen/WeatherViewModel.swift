//
//  WeatherViewModel.swift
//  sui-weather
//
//  Created by Egor Tushev on 27.05.2024.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var days: [Weather] = []
    private let weatherService = WeatherService()
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        weatherService.fetchWeatherData { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.days = weather
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
