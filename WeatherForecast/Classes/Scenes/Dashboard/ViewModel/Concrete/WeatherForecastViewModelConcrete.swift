//
//  WeatherForecastViewModelConcrete.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

class WeatherForecastViewModelConcrete {
    
    var stateViewModel: Bindable<WeatherForecastStatesEnum?> = Bindable(.loading)
    
    private var service: WeatherForecastService
    
    init(service: WeatherForecastService) {
        self.service = service
    }
}

extension WeatherForecastViewModelConcrete: WeatherForecastViewModel {
    func fetchWeather(model: CityModel) {
        stateViewModel.value = .loading
        service.fetchData(city: model) { [weak self] response, errorMessage in
            guard let self else { return }
            
            if let errorMessage {
                self.stateViewModel.value = .error(errorMessage)
            } else if let response {
                self.stateViewModel.value = .data(response)
            }
        }
    }
}
