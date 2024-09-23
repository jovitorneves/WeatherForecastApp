//
//  UIImageViewExtensionTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class UIImageViewExtensionTests: XCTestCase {
    
    func testSetBackgroundImage_WithValidImageName_ShouldSetImage() {
        let imageView = UIImageView()
        let validImageName = "background-day"

        imageView.setBackgroundImage(named: validImageName)

        XCTAssertNotNil(imageView.image, "A imagem não deve ser nil para um nome de imagem válido.")
    }

    func testSetBackgroundImage_WithInvalidImageName_ShouldNotSetImage() {
        let imageView = UIImageView()
        let invalidImageName = "invalidImageName"

        imageView.setBackgroundImage(named: invalidImageName)

        XCTAssertNil(imageView.image, "A imagem deve ser nil para um nome de imagem inválido.")
    }
}
