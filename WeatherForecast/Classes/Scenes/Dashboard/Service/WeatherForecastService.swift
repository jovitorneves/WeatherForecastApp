//
//  WeatherForecastService.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

protocol WeatherForecastService {
    func fetchData(city: CityModel,
                   _ completion: @escaping (ForecastResponse?, String?) -> Void)
}
