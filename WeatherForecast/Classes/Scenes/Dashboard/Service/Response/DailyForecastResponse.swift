//
//  DailyForecastResponse.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

struct DailyForecastResponse: Codable {
    let dt: Int
    let temp: TempResponse
    let weather: [WeatherResponse]
}
