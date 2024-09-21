//
//  LocalizableWeatherForecast.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import Foundation

enum LocalizableWeatherForecast: String, Localizable {
    case titleAppLabel
    case signInButton
    case alertButton
    case alertMessage
    case humidityLabel
    case emailPlaceholder
    case passwordPlaceholder
    case confirmPasswordPlaceholder
    case signUpButton
    case userErrorMsg
    case initView
    case windLabel
    case hourlyForecastLabel
    case dailyForecastLabel
    case errorAPI
    
    var table: String {
        "Localizable"
    }
}
