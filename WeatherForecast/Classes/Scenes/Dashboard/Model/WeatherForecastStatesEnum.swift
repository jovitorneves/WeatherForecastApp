//
//  WeatherForecastStatesEnum.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

enum WeatherForecastStatesEnum {
    case error(String)
    case loading
    case data(ForecastResponse)
}
