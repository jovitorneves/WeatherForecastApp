//
//  IntExtensionsTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import Foundation
import XCTest
@testable import WeatherForecast

class IntExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testToWeekdayName() {
        // Given
        let timestampSunday = 1672531199 // Dec 31, 2022 (Saturday)
        let timestampMonday = 1672617599 // Jan 1, 2023 (Sunday)
        let timestampTuesday = 1672703999 // Jan 2, 2023 (Monday)
        
        // When & Then
        XCTAssertEqual(timestampSunday.toWeekdayName(), "sáb.", "Should return 'Sáb' for timestamp corresponding to Saturday.")
        XCTAssertEqual(timestampMonday.toWeekdayName(), "dom.", "Should return 'Dom' for timestamp corresponding to Sunday.")
        XCTAssertEqual(timestampTuesday.toWeekdayName(), "seg.", "Should return 'seg' for timestamp corresponding to Monday.")
    }

    func testToHourFormat() {
        // Given
        let timestampEvening = 1672606800 // Jan 1, 2023 06:00 PM
        
        // When & Then
        XCTAssertEqual(timestampEvening.toHourFormat(), "18:00", "Should return '18:00' for the given timestamp.")
    }

    func testIsDayTime() {
        // Given
        let timestampAfternoon = 1672578000 // Jan 1, 2023 10:00 AM
        let timestampNight = 1672546800 // Jan 1, 2023 01:20 AM
        
        // When & Then
        XCTAssertTrue(timestampAfternoon.isDayTime(), "10:00 AM should be considered daytime.")
        XCTAssertFalse(timestampNight.isDayTime(), "01:20 AM should not be considered daytime.")
    }
}
