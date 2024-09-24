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
    case titleScreenAccessibilityIdentifier
    case emailTextFieldAccessibilityIdentifier
    case passwordTextFieldAccessibilityIdentifier
    case signUpButtonAccessibilityIdentifier
    case signInButtonAccessibilityIdentifier
    case confirmPasswordTextFieldAccessibilityIdentifier
    case loaderAccessibilityIdentifier
    case cityLabelAccessibilityIdentifier
    case temperatureLabelAccessibilityIdentifier
    case humidityLabelAccessibilityIdentifier
    case humidityValueLabelAccessibilityIdentifier
    case windLabelAccessibilityIdentifier
    case windValueLabelAccessibilityIdentifier
    case hourlyForecastLabelAccessibilityIdentifier
    case dailyForecastLabelAccessibilityIdentifier
    case hourLabelAccessibilityIdentifier
    case weekDayLabelAccessibilityIdentifier
    case minTemperatureLabelAccessibilityIdentifier
    case maxTemperatureLabelAccessibilityIdentifier
    
    var table: String {
        "Localizable"
    }
}
