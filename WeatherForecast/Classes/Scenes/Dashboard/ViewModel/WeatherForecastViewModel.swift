//
//  WeatherForecastViewModel.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

protocol WeatherForecastViewModel {
    var stateViewModel: Bindable<WeatherForecastStatesEnum?> { get }
    
    func fetchWeather(model: CityModel)
}
