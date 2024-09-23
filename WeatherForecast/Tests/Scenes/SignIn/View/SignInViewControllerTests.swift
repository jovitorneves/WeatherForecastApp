//
//  SignInViewControllerTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class SignInViewControllerTests: XCTestCase {
    
    var signInViewController: SignInViewController!
    var mockViewModel: SignInViewModelSpy!

    override func setUp() {
        super.setUp()
        mockViewModel = SignInViewModelSpy()
        signInViewController = SignInViewController(viewModel: mockViewModel)
        
        _ = signInViewController.view
    }

    override func tearDown() {
        signInViewController = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    func testViewDidLoad_ShouldSetupViewsAndConstraints() {
        // Given
        // The view is already loaded in setUp
        
        // When
        let stackView = signInViewController.view.subviews.first as? UIStackView
        
        // Then
        XCTAssertNotNil(stackView, "Stack view should be added as a subview.")
        XCTAssertEqual(stackView?.axis, .vertical, "Stack view axis should be vertical.")
        XCTAssertEqual(stackView?.spacing, .zero, "Stack view spacing should be zero.")
    }
    
    func testViewWillAppear_ShouldHideNavigationBar() {
        // Given
        let navigationController = UINavigationController(rootViewController: signInViewController)

        // When
        signInViewController.viewWillAppear(false)

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            XCTAssertTrue(navigationController.isNavigationBarHidden, "Navigation bar should be hidden.")
        }
    }
}
