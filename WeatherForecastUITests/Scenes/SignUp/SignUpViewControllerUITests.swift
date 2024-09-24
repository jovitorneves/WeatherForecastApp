//
//  SignUpViewControllerUITests.swift
//  WeatherForecastUITests
//
//  Created by J. Vitor Neves on 24/09/24.
//

import XCTest

final class SignUpViewControllerUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSuccessSignUp() throws {
        let elementsQuery = app.scrollViews.otherElements
        
        let openFrameworkButton = app.staticTexts["Open Weather Forecast framework"]
        XCTAssert(openFrameworkButton.exists)
        openFrameworkButton.tap()
        
        let signInButton = elementsQuery.buttons["signUpButtonAccessibilityIdentifier"]
        XCTAssert(signInButton.exists)
        signInButton.tap()
        
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
        
        let confirmPasswordTextField = elementsQuery.secureTextFields["confirmPasswordTextFieldAccessibilityIdentifier"]
        XCTAssert(confirmPasswordTextField.exists)
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("123456")
        let confirmPasswordFieldValue = confirmPasswordTextField.value as? String
        XCTAssertEqual(confirmPasswordFieldValue ?? String(), "••••••")
        
        let signInTwoButton = elementsQuery.buttons["signUpButtonAccessibilityIdentifier"]
        XCTAssert(signInTwoButton.exists)
        signInTwoButton.tap()
    }
}
