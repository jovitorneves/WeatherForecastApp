//
//  WeatherForecastViewControllerTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import Foundation
import XCTest
import UIKit
@testable import WeatherForecast

class WeatherForecastViewControllerTests: XCTestCase {

    var viewController: WeatherForecastViewController!
    var mockViewModel: WeatherForecastViewModelSpy!

    override func setUp() {
        super.setUp()
        mockViewModel = WeatherForecastViewModelSpy()
        viewController = WeatherForecastViewController(viewModel: mockViewModel)
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        mockViewModel = nil
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertNotNil(viewController.stackView)
        XCTAssertNotNil(viewController.loaderView)
        XCTAssertNotNil(viewController.loader)
        XCTAssertTrue(viewController.view.backgroundColor == .white)
    }

    func testViewModelBindingErrorState() {
        let expectation = XCTestExpectation(description: "Handle error state from ViewModel")

        viewController.bindViewModelStateViewModel()
        
        // Simulate error state
        mockViewModel.simulateError("Failed to fetch data")

        XCTAssertTrue(mockViewModel.fetchWeatherCalled)
    }

    func testViewModelBindingLoadingState() {
        let expectation = XCTestExpectation(description: "Handle loading state from ViewModel")

        viewController.bindViewModelStateViewModel()

        // Simulate loading state
        mockViewModel.simulateLoading()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.viewController.loaderView.isHidden == false)
            XCTAssertTrue(self.viewController.stackView.arrangedSubviews.isEmpty)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
