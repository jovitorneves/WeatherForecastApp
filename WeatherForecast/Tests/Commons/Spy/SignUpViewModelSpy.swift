//
//  SignUpViewModelSpy.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class SignUpViewModelSpy: SignUpViewModel {
    var isSuccess: WeatherForecast.Bindable<Bool> = .init(false)
    
    var isValidationCalled = false
    var validationEmail: String?
    var validationPassword: String?
    var validationConfirmPassword: String?

    func validationRegister(email: String, password: String, confirmPassword: String) {
        isValidationCalled = true
        validationEmail = email
        validationPassword = password
        validationConfirmPassword = confirmPassword
    }
}
