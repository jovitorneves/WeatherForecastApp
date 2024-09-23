//
//  WeatherForecastViewTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class WeatherForecastViewTests: XCTestCase {

    var weatherForecastView: WeatherForecastView!
    var mockViewModel: WeatherForecastViewModelSpy!

    override func setUp() {
        super.setUp()
        // Initialize the mock ViewModel and the WeatherForecastView
        mockViewModel = WeatherForecastViewModelSpy()
        weatherForecastView = WeatherForecastView(viewModel: mockViewModel)
        
        // Load the view to set up the UI
        _ = weatherForecastView
    }

    override func tearDown() {
        weatherForecastView = nil
        mockViewModel = nil
        super.tearDown()
    }

    // Test to verify that all UI components are initialized correctly
    func testInitialization_ShouldSetUpViewsCorrectly() {
        XCTAssertNotNil(weatherForecastView.backgroundView, "Background view should be initialized.")
        XCTAssertNotNil(weatherForecastView.headerView, "Header view should be initialized.")
        XCTAssertNotNil(weatherForecastView.cityLabel, "City label should be initialized.")
        XCTAssertNotNil(weatherForecastView.temperatureLabel, "Temperature label should be initialized.")
        XCTAssertNotNil(weatherForecastView.weatherIcon, "Weather icon should be initialized.")
        XCTAssertNotNil(weatherForecastView.humidityLabel, "Humidity label should be initialized.")
        XCTAssertNotNil(weatherForecastView.humidityValueLabel, "Humidity value label should be initialized.")
        XCTAssertNotNil(weatherForecastView.windLabel, "Wind label should be initialized.")
        XCTAssertNotNil(weatherForecastView.windValueLabel, "Wind value label should be initialized.")
        XCTAssertNotNil(weatherForecastView.hourlyForecastLabel, "Hourly forecast label should be initialized.")
        XCTAssertNotNil(weatherForecastView.hourlyCollectionView, "Hourly collection view should be initialized.")
        XCTAssertNotNil(weatherForecastView.dailyForecastLabel, "Daily forecast label should be initialized.")
        XCTAssertNotNil(weatherForecastView.dailyForecastTableView, "Daily forecast table view should be initialized.")
    }
}
