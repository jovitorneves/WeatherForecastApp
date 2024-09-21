//
//  WeatherForecastServiceConcrete.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

class WeatherForecastServiceConcrete {
    
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "520bf8f9ddceeabbd1c0fcd72b63c33e"
    private let nameMock: String = "weatherForecastMock"
    private let typeJson: String = "json"
    private let session = URLSession.shared
    
    init() {
        // intentionally not implemented
    }
    
    private func weatherForecastServiceMock() -> ForecastResponse? {
        if let path = Bundle(for: WeatherForecastServiceConcrete.self).path(forResource: nameMock,
                                                                            ofType: typeJson) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let forecastResponse = try decoder.decode(ForecastResponse.self,
                                                          from: data)
                return forecastResponse
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}

extension WeatherForecastServiceConcrete: WeatherForecastService {
    func fetchData(city: CityModel,
                   _ completion: @escaping (ForecastResponse?, String?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(self.weatherForecastServiceMock(), nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse, nil)
            } catch {
                completion(nil, LocalizableWeatherForecast.errorAPI.localized)
            }
        }
        task.resume()
    }
}
