//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

struct WeatherResponse: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
