//
//  WeatherForecastViewControllerSnapshotTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 24/09/24.
//

import XCTest
import FBSnapshotTestCase
@testable import WeatherForecast

final class WeatherForecastViewControllerSnapshotTests: FBSnapshotTestCase {
    
    var sut: WeatherForecastViewController!
    var mockViewModel: WeatherForecastViewModelSpy!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    override func setUpWithError() throws {
        mockViewModel = WeatherForecastViewModelSpy()
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 850))
        window.rootViewController = sut
        window.makeKeyAndVisible()
        sut = WeatherForecastViewController(viewModel: mockViewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
    }

    func testView()  {
        let expectation = XCTestExpectation(description: "Wait for 1 second")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.FBSnapshotVerifyView(self.sut.view)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
