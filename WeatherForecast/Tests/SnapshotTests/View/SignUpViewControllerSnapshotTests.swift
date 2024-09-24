//
//  SignUpViewControllerSnapshotTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 24/09/24.
//

import XCTest
import FBSnapshotTestCase
@testable import WeatherForecast

final class SignUpViewControllerSnapshotTests: FBSnapshotTestCase {
    
    var sut: SignUpViewController!
    var mockViewModel: SignUpViewModelSpy!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    override func setUpWithError() throws {
        mockViewModel = SignUpViewModelSpy()
        sut = SignUpViewController(viewModel: mockViewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
    }

    func testView()  {
        FBSnapshotVerifyView(sut.view)
    }
}
