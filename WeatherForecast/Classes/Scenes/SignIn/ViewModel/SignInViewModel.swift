//
//  SignInViewModel.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 12/09/24.
//

import Foundation

protocol SignInViewModel {
    var stateViewModel: Bindable<SignInStatesEnum?> { get }
    
    func openSignUp()
    func validationLogin(email: String,
                         password: String)
}
