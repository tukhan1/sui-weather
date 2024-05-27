//
//  DTO.swift
//  sui-weather
//
//  Created by Egor Tushev on 27.05.2024.
//

import Foundation

struct WeatherForcast: Decodable {
    let forecast: Forecast
}

struct Forecast: Decodable {
    let forecastday: [Daily]
}

struct Daily: Decodable {
    let date: String
    let day: Day
}

struct Day: Decodable {
    let avgtemp_c: Double
    let condition: Condition
}

struct Condition: Decodable {
    let text: String
    let icon: String
}

struct Weather {
    let day: String
    let imageName: String
    let temperature: Int
}
