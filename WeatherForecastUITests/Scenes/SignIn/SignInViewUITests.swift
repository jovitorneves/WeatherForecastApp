//
//  SignInViewUITests.swift
//  WeatherForecastUITests
//
//  Created by J. Vitor Neves on 19/09/24.
//

import XCTest

final class SignInViewUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testNavigation() throws {
        let mockButton = app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(mockButton.exists)
        mockButton.tap()
        
        let titleLabel = app.scrollViews.otherElements.staticTexts["titleLabel"]
        XCTAssert(titleLabel.exists)
        XCTAssertEqual(titleLabel.label, "titleLabel")
        
        let mockButton2 = app.staticTexts["Botão 2"]
        XCTAssert(mockButton2.exists)
        mockButton2.tap()
        
        let backButton = app.navigationBars["Login.LoginView"].buttons["Back"]
        XCTAssert(backButton.exists)
        backButton.tap()
    }
}
