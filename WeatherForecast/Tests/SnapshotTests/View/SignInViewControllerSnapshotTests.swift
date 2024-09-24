//
//  SignInViewControllerSnapshotTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 24/09/24.
//

import XCTest
import FBSnapshotTestCase
@testable import WeatherForecast

final class SignInViewControllerSnapshotTests: FBSnapshotTestCase {
    
    var sut: SignInViewController!
    var mockViewModel: SignInViewModelSpy!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    override func setUpWithError() throws {
        mockViewModel = SignInViewModelSpy()
        sut = SignInViewController(viewModel: mockViewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
    }

    func testView()  {
        FBSnapshotVerifyView(sut.view)
    }
}
