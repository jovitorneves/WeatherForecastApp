//
//  WeatherForecastViewControllerUITests.swift
//  WeatherForecastUITests
//
//  Created by J. Vitor Neves on 24/09/24.
//

import XCTest

final class WeatherForecastViewControllerUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testOpenWeatherForecast() throws {
        let elementsQuery = app.scrollViews.otherElements
        
        let openFrameworkButton = app.staticTexts["Open Weather Forecast framework"]
        XCTAssert(openFrameworkButton.exists)
        openFrameworkButton.tap()
        
        let titleLabel = elementsQuery.staticTexts["titleScreenAccessibilityIdentifier"]
        XCTAssert(titleLabel.exists)
        XCTAssertEqual(titleLabel.label, "Weather Forecast")
        
        let emailTextField = elementsQuery.textFields["emailTextFieldAccessibilityIdentifier"]
        XCTAssert(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        let textFieldValue = emailTextField.value as? String
        XCTAssertEqual(textFieldValue ?? String(), "test@test.com")
        
        let passwordTextField = elementsQuery.secureTextFields["passwordTextFieldAccessibilityIdentifier"]
        XCTAssert(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        let passwordFieldValue = passwordTextField.value as? String
        XCTAssertEqual(passwordFieldValue ?? String(), "••••••")
        
        let signInButton = elementsQuery.buttons["signInButtonAccessibilityIdentifier"]
        XCTAssert(signInButton.exists)
        signInButton.tap()
        
        let loaderDashboard = app.activityIndicators["loaderAccessibilityIdentifier"]
        XCTAssert(loaderDashboard.exists)
        
        let cityLabel = app.staticTexts["cityLabelAccessibilityIdentifier"]
        let existsCityLabel = cityLabel.waitForExistence(timeout: 0.5)
        XCTAssertTrue(existsCityLabel)
        
        let temperatureLabel = app.staticTexts["temperatureLabelAccessibilityIdentifier"]
        XCTAssert(temperatureLabel.exists)
        
        let humidityLabel = app.staticTexts["humidityLabelAccessibilityIdentifier"]
        XCTAssert(humidityLabel.exists)
        
        let windLabel = app.staticTexts["windLabelAccessibilityIdentifier"]
        XCTAssert(windLabel.exists)
        
        let humidityValueLabel = app.staticTexts["humidityValueLabelAccessibilityIdentifier"]
        XCTAssert(humidityValueLabel.exists)
        
        let windValueLabel = app.staticTexts["windValueLabelAccessibilityIdentifier"]
        XCTAssert(windValueLabel.exists)
        
        let hourlyForecastLabel = app.staticTexts["hourlyForecastLabelAccessibilityIdentifier"]
        XCTAssert(hourlyForecastLabel.exists)
        
        let dailyForecastLabel = app.staticTexts["dailyForecastLabelAccessibilityIdentifier"]
        XCTAssert(dailyForecastLabel.exists)
        
        let tablesQuery = app.tables
        
        let minTemperatureLabelAccessibilityIdentifier_0 = tablesQuery.cells.containing(.staticText, identifier:"minTemperatureLabelAccessibilityIdentifier_0").element
        XCTAssert(minTemperatureLabelAccessibilityIdentifier_0.exists)
        
        let maxTemperatureLabelAccessibilityIdentifier_0 = tablesQuery.cells.containing(.staticText, identifier:"maxTemperatureLabelAccessibilityIdentifier_0").element
        XCTAssert(maxTemperatureLabelAccessibilityIdentifier_0.exists)
        
        let weekDayLabelAccessibilityIdentifier_0 = tablesQuery.cells.containing(.staticText, identifier:"weekDayLabelAccessibilityIdentifier_0").element
        XCTAssert(weekDayLabelAccessibilityIdentifier_0.exists)
        
        let collectionViewsQuery = app.collectionViews
        
        let hourLabelAccessibilityIdentifier_0 = collectionViewsQuery.staticTexts["hourLabelAccessibilityIdentifier_0"]
        XCTAssert(hourLabelAccessibilityIdentifier_0.exists)
        
        let temperatureLabelAccessibilityIdentifier_0 = collectionViewsQuery.staticTexts["temperatureLabelAccessibilityIdentifier_0"]
        XCTAssert(temperatureLabelAccessibilityIdentifier_0.exists)
    }
}
