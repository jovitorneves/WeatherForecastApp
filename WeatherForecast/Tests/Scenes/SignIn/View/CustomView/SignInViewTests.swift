//
//  SignInViewTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 19/09/24.
//

import XCTest
@testable import WeatherForecast

class SignInViewTests: XCTestCase {

    var signInView: SignInView!
    var mockViewModel: SignInViewModelSpy!

    override func setUp() {
        super.setUp()
        mockViewModel = SignInViewModelSpy()
        signInView = SignInView(viewModel: mockViewModel)
        signInView.layoutIfNeeded()
    }

    override func tearDown() {
        signInView = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    func testSignInViewInitialization() {
        XCTAssertNotNil(signInView.scrollView)
        XCTAssertNotNil(signInView.contentView)
        XCTAssertNotNil(signInView.stackView)
        XCTAssertNotNil(signInView.titleSignIn)
        XCTAssertNotNil(signInView.emailTextField)
        XCTAssertNotNil(signInView.passwordTextField)
        XCTAssertNotNil(signInView.signUpButton)
        XCTAssertNotNil(signInView.signInButton)
    }

    func testOpenSignUpAction() {
        signInView.signUpButton.sendActions(for: .touchUpInside)
        signInView.signInButton.sendActions(for: .touchDown)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertTrue(self.mockViewModel.didCallOpenSignUp)
        }
    }

    func testValidationLoginActionWithValidCredentials() {
        signInView.emailTextField.text = "test@example.com"
        signInView.passwordTextField.text = "password123"
        
        signInView.signInButton.sendActions(for: .touchUpInside)
        signInView.signInButton.sendActions(for: .touchDown)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertTrue(self.mockViewModel.didCallValidationLogin)
            XCTAssertEqual(self.mockViewModel.email, "test@example.com")
            XCTAssertEqual(self.mockViewModel.password, "password123")
        }
    }

    func testValidationLoginActionWithEmptyCredentials() {
        signInView.emailTextField.text = ""
        signInView.passwordTextField.text = ""

        signInView.signInButton.sendActions(for: .touchUpInside)
        signInView.signInButton.sendActions(for: .touchDown)

        XCTAssertFalse(mockViewModel.didCallValidationLogin)
    }
}
