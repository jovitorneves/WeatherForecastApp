//
//  DoubleExtensionTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class DoubleExtensionTests: XCTestCase {
    
    func testToCelsius_WithPositiveValue_ShouldReturnFormattedString() {
        // Given
        let value: Double = 25.0
        
        // When
        let result = value.toCelsius()
        
        // Then
        XCTAssertEqual(result, "25°C", "The returned string should be '25°C' for the value 25.0")
    }
    
    func testToCelsius_WithNegativeValue_ShouldReturnFormattedString() {
        // Given
        let value: Double = -5.0
        
        // When
        let result = value.toCelsius()
        
        // Then
        XCTAssertEqual(result, "-5°C", "The returned string should be '-5°C' for the value -5.0")
    }
    
    func testToCelsius_WithZero_ShouldReturnFormattedString() {
        // Given
        let value: Double = 0.0
        
        // When
        let result = value.toCelsius()
        
        // Then
        XCTAssertEqual(result, "0°C", "The returned string should be '0°C' for the value 0.0")
    }
    
    func testToCelsius_WithDecimalValue_ShouldReturnFormattedString() {
        // Given
        let value: Double = 23.7
        
        // When
        let result = value.toCelsius()
        
        // Then
        XCTAssertEqual(result, "23°C", "The returned string should be '23°C' for the value 23.7")
    }
}
