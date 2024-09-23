//
//  StringExtensionsTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class StringExtensionsTests: XCTestCase {

    func testValidEmail() {
        // Given
        let validEmails = [
            "test@example.com",
            "user.name+tag+sorting@example.com",
            "user.name@example.co.uk",
            "user_name@subdomain.example.com"
        ]
        
        // When & Then
        for email in validEmails {
            XCTAssertTrue(email.isValidEmail(), "\(email) should be a valid email.")
        }
    }
    
    func testInvalidEmail() {
        // Given
        let invalidEmails = [
            "plainaddress",
            "@missingusername.com",
            "username@.com",
            "username@domain,com",
            "username@domain.c"
        ]
        
        // When & Then
        for email in invalidEmails {
            XCTAssertFalse(email.isValidEmail(), "\(email) should not be a valid email.")
        }
    }

    func testValidPassword() {
        // Given
        let validPasswords = [
            "123456",
            "abcdef",
            "abc123",
            "password"
        ]
        
        // When & Then
        for password in validPasswords {
            XCTAssertTrue(password.isValidPassword(), "\(password) should be a valid password.")
        }
    }
    
    func testInvalidPassword() {
        // Given
        let invalidPasswords = [
            "12345",     // 5 characters
            "abc",       // 3 characters
            "",          // empty
            "ab"         // 2 characters
        ]
        
        // When & Then
        for password in invalidPasswords {
            XCTAssertFalse(password.isValidPassword(), "\(password) should not be a valid password.")
        }
    }
}
