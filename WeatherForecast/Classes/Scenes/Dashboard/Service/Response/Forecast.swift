//
//  Forecast.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [WeatherResponse]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}
