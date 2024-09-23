//
//  SignUpViewControllerTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import Foundation
import XCTest
@testable import WeatherForecast

class SignUpViewControllerTests: XCTestCase {
    
    // MARK: - Properties
    var sut: SignUpViewController!
    var mockViewModel: SignUpViewModelSpy!
    
    override func setUp() {
        super.setUp()
        mockViewModel = SignUpViewModelSpy()
        sut = SignUpViewController(viewModel: mockViewModel)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testViewDidLoadConfiguresView() {
        XCTAssertNotNil(sut.stackView)
        XCTAssertNotNil(sut.signInView)
        XCTAssertEqual(sut.view.backgroundColor, .primaryColor)
    }
    
    func testBindViewModelIsSuccessDoesNotShowAlertOnSuccess() {
        mockViewModel.isSuccess.value = true
        
        sut.bindViewModelIsSuccess()
        sut.viewWillAppear(false)
        
        let presentedViewController = sut.presentedViewController
        XCTAssertNil(presentedViewController)
    }
}
