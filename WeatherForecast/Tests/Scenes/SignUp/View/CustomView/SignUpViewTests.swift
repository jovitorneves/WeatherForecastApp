//
//  SignUpViewTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class SignUpViewTests: XCTestCase {
    
    var signUpView: SignUpView!
    var mockViewModel: SignUpViewModelSpy!
    
    override func setUp() {
        super.setUp()
        mockViewModel = SignUpViewModelSpy()
        signUpView = SignUpView(viewModel: mockViewModel)
        signUpView.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
    }

    override func tearDown() {
        signUpView = nil
        mockViewModel = nil
        super.tearDown()
    }

    func testSignUpViewInitialization() {
        // Check if the main components are not nil
        XCTAssertNotNil(signUpView.scrollView)
        XCTAssertNotNil(signUpView.contentView)
        XCTAssertNotNil(signUpView.stackView)
        XCTAssertNotNil(signUpView.titleSignIn)
        XCTAssertNotNil(signUpView.emailTextField)
        XCTAssertNotNil(signUpView.passwordTextField)
        XCTAssertNotNil(signUpView.confirmPasswordTextField)
        XCTAssertNotNil(signUpView.signUpButton)
        
        // Check the title of the label
        XCTAssertEqual(signUpView.titleSignIn.text, LocalizableWeatherForecast.titleAppLabel.localized)
        XCTAssertEqual(signUpView.emailTextField.placeholder, LocalizableWeatherForecast.emailPlaceholder.localized)
        XCTAssertEqual(signUpView.passwordTextField.placeholder, LocalizableWeatherForecast.passwordPlaceholder.localized)
        XCTAssertEqual(signUpView.confirmPasswordTextField.placeholder, LocalizableWeatherForecast.confirmPasswordPlaceholder.localized)
        XCTAssertEqual(signUpView.signUpButton.title(for: .normal), LocalizableWeatherForecast.signUpButton.localized)
    }

    func testSignUpButtonActionCallsValidation() {
        // Given
        signUpView.emailTextField.text = "test@example.com"
        signUpView.passwordTextField.text = "password123"
        signUpView.confirmPasswordTextField.text = "password123"

        // When
        signUpView.signUpButton.sendActions(for: .touchUpInside)

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(self.mockViewModel.isValidationCalled)
            XCTAssertEqual(self.mockViewModel.validationEmail, "test@example.com")
            XCTAssertEqual(self.mockViewModel.validationPassword, "password123")
            XCTAssertEqual(self.mockViewModel.validationConfirmPassword, "password123")
        }
    }

    func testSignUpViewLayoutConstraints() {
        // Add the view to a superview
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 600))
        superView.addSubview(signUpView)
        
        // Ensure the view layout is set correctly
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpView.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            signUpView.topAnchor.constraint(equalTo: superView.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])

        // Trigger layout
        superView.layoutIfNeeded()
        
        XCTAssertTrue(signUpView.scrollView.isDescendant(of: signUpView))
        XCTAssertTrue(signUpView.contentView.isDescendant(of: signUpView.scrollView))
    }
}
