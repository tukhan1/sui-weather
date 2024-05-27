//
//  WeatherService.swift
//  sui-weather
//
//  Created by Egor Tushev on 13.05.2024.
//

import UIKit

class WeatherService {
    
    private static let apiKey = ""
    
    func fetchWeatherData(complition: @escaping (Result<[Weather], Error>) -> Void) {
        
        let stringURL = "http://api.weatherapi.com/v1/forecast.json?key=\(Self.apiKey)&q=moscow&days=6"
        
        guard let url = URL(string: stringURL) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let safeData = data else {
                complition(.failure(NSError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherForcast.self, from: safeData)
                let weather = decodedData.forecast.forecastday.map {
                    Weather(day: $0.date.toDayOfTheWeek(),
                            imageName: $0.day.condition.icon.replacingOccurrences(of: "//", with: "http://"),
                            temperature: Int($0.day.avgtemp_c))
                }
                complition(.success(weather))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
