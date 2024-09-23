//
//  UserManagerTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class UserManagerTests: XCTestCase {
    
    var userManager: UserManager!

    override func setUp() {
        super.setUp()
        userManager = UserManager.shared
        // Clear any existing user data before each test
        userManager.clearUserData()
    }

    override func tearDown() {
        // Clear user data after each test
        userManager.clearUserData()
        super.tearDown()
    }

    func testSaveUser_ShouldSaveUserData() {
        // Given
        let user = UserModel(email: "john.doe@example.com", password: "securePassword123")
        
        // When
        userManager.saveUser(user)
        
        // Then
        let retrievedUser = userManager.getUser()
        XCTAssertNotNil(retrievedUser, "User should be retrieved successfully after saving.")
        XCTAssertEqual(retrievedUser?.email, user.email, "User email should match the saved user's email.")
        XCTAssertEqual(retrievedUser?.password, user.password, "User password should match the saved user's password.")
    }
    
    func testGetUser_WhenNoUserSaved_ShouldReturnNil() {
        // When
        let retrievedUser = userManager.getUser()
        
        // Then
        XCTAssertNil(retrievedUser, "Should return nil when no user data is saved.")
    }
    
    func testClearUserData_ShouldRemoveUserData() {
        // Given
        let user = UserModel(email: "jane.doe@example.com", password: "anotherPassword123")
        userManager.saveUser(user)
        
        // When
        userManager.clearUserData()
        
        // Then
        let retrievedUser = userManager.getUser()
        XCTAssertNil(retrievedUser, "User should be nil after clearing user data.")
    }
}
