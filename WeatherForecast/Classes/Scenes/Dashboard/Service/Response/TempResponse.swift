//
//  TempResponse.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

struct TempResponse: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
