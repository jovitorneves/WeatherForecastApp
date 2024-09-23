//
//  WeatherForecastCoordinatorTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class WeatherForecastCoordinatorTests: XCTestCase {
    
    var navigationController: NavigationControllerSpy!
    var coordinator: WeatherForecastCoordinator!

    override func setUp() {
        super.setUp()
        navigationController = NavigationControllerSpy()
        coordinator = WeatherForecastCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
        navigationController = nil
        coordinator = nil
        super.tearDown()
    }

    func testStartPresentsSignInViewController() {
        // When
        coordinator.start()

        // Then
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.viewControllers.first is SignInViewController)
    }

    func testOpenSignUpPresentsSignUpViewController() {
        // Given
        coordinator.start()

        // When
        coordinator.openSignUp()

        // Then
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertTrue(navigationController.viewControllers.last is SignUpViewController)
        XCTAssertFalse(navigationController.isNavigationBarHiddenCalled)
    }

    func testOpenDashboardPresentsWeatherForecastViewController() {
        // Given
        coordinator.start()
        coordinator.openDashboard()

        // Then
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertTrue(navigationController.viewControllers.last is WeatherForecastViewController)
        XCTAssertTrue(navigationController.isNavigationBarHiddenCalled)
    }

    func testPopViewController() {
        // Given
        coordinator.start()
        coordinator.openSignUp()

        // When
        coordinator.popViewController()

        // Then
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.viewControllers.first is SignInViewController)
    }
}
