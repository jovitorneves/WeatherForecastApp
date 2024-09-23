//
//  WeatherForecastViewModelSpy.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class WeatherForecastViewModelSpy: WeatherForecastViewModel {
    var stateViewModel: WeatherForecast.Bindable<WeatherForecast.WeatherForecastStatesEnum?> = .init(.loading)
    var fetchWeatherCalled = false
    
    func fetchWeather(model: WeatherForecast.CityModel) {
        fetchWeatherCalled = true
    }

    func unbindAll() {
        stateViewModel.value = nil
    }

    func simulateLoading() {
        stateViewModel.value = .loading
    }

    func simulateData(_ forecast: ForecastResponse) {
        stateViewModel.value = .data(forecast)
    }

    func simulateError(_ error: String) {
        stateViewModel.value = .error(error)
    }
}
