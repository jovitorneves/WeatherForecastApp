//
//  SignInViewTests.swift
//  WeatherForecastUITests
//
//  Created by J. Vitor Neves on 19/09/24.
//

import XCTest
@testable import WeatherForecast

class LoginViewTests: XCTestCase {

    var viewModel: MockSignInViewModel!
    var signInView: SignInView!
    
    override func setUpWithError() throws {
        viewModel = MockSignInViewModel()
        
        signInView = SignInView(viewModel: viewModel)
        
        let window = UIWindow()
        window.addSubview(signInView)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        signInView = nil
    }
    
    func testSubviewsAdded() throws {
        XCTAssertTrue(signInView.subviews.contains(signInView.scrollView), "ScrollView não foi adicionado")
        XCTAssertTrue(signInView.scrollView.subviews.contains(signInView.contentView), "ContentView não foi adicionado à ScrollView")
        XCTAssertTrue(signInView.contentView.subviews.contains(signInView.stackView), "StackView não foi adicionado à ContentView")
        XCTAssertTrue(signInView.stackView.arrangedSubviews.contains(signInView.titleSignIn), "Label não foi adicionada à StackView")
    }
}

class MockSignInViewModel: SignInViewModel {
    var stateViewModel: WeatherForecast.Bindable<SignInStatesEnum?> = Bindable(nil)
    
    var openLoginCalled = false
    
    init() {
        
    }
    
    func openLogin() {
        openLoginCalled = true
    }
    
    func openSignUp() {
        
    }
    
    func validationLogin(email: String, password: String) {
        
    }
}
