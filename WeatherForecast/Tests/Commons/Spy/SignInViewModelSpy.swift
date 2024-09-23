//
//  SignInViewModelSpy.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 23/09/24.
//

import Foundation
@testable import WeatherForecast

class SignInViewModelSpy: SignInViewModel {
    var stateViewModel: WeatherForecast.Bindable<SignInStatesEnum?> = Bindable(nil)
    
    var didCallOpenSignUp = false
    var didCallValidationLogin = false
    var email: String?
    var password: String?
    
    func openSignUp() {
        didCallOpenSignUp = true
    }
    
    func validationLogin(email: String, password: String) {
        didCallValidationLogin = true
        self.email = email
        self.password = password
    }
}
