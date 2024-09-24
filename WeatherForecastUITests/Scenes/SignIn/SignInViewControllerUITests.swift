//
//  SignInViewControllerUITests.swift
//  WeatherForecastUITests
//
//  Created by J. Vitor Neves on 19/09/24.
//

import XCTest

final class SignInViewControllerUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testErrorSignIn() throws {
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
        emailTextField.typeText("testtest.com")
        let textFieldValue = emailTextField.value as? String
        XCTAssertEqual(textFieldValue ?? String(), "testtest.com")
        
        let passwordTextField = elementsQuery.secureTextFields["passwordTextFieldAccessibilityIdentifier"]
        XCTAssert(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        let passwordFieldValue = passwordTextField.value as? String
        XCTAssertEqual(passwordFieldValue ?? String(), "••••••")
        
        let signInButton = elementsQuery.buttons["signInButtonAccessibilityIdentifier"]
        XCTAssert(signInButton.exists)
        signInButton.tap()
        
        let alertSignIn = app.alerts["Weather Forecast"]
        XCTAssert(alertSignIn.exists)
        
        let elementsAlertQuery = alertSignIn.scrollViews.otherElements
        
        let alertTitleSignIn = elementsAlertQuery.staticTexts["Weather Forecast"]
        XCTAssert(alertTitleSignIn.exists)
        XCTAssertEqual(alertTitleSignIn.label, "Weather Forecast")
        
        let alertMessageSignIn = elementsAlertQuery.staticTexts["Invalid fields!"]
        XCTAssert(alertMessageSignIn.exists)
        XCTAssertEqual(alertMessageSignIn.label, "Invalid fields!")
        
        let alertButtonSignIn = elementsAlertQuery.buttons["OK"]
        XCTAssert(alertButtonSignIn.exists)
        alertButtonSignIn.tap()
    }
}
