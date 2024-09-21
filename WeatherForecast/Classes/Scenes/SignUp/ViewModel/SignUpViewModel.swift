//
//  SignUpViewModel.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

protocol SignUpViewModel {
    var isSuccess: Bindable<Bool> { get }
    
    func validationRegister(email: String,
                            password: String,
                            confirmPassword: String)
}
