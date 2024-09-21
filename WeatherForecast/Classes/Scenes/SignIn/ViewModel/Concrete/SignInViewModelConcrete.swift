//
//  SignInViewModelConcrete.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import Foundation

class SignInViewModelConcrete {
    
    var stateViewModel: Bindable<SignInStatesEnum?> = Bindable(nil)
    
    private weak var delegate: SignInViewModelDelegate?
    
    init(delegate: SignInViewModelDelegate?) {
        self.delegate = delegate
    }
}

extension SignInViewModelConcrete: SignInViewModel {
    func openSignUp() {
        delegate?.openSignUp()
    }
    
    func validationLogin(email: String,
                         password: String) {
        let savedUser = UserManager.shared.getUser()
        if email.isEmpty ||
            password.isEmpty ||
            !email.isValidEmail() ||
            !password.isValidPassword() {
            stateViewModel.value = .error(LocalizableWeatherForecast.alertMessage.localized)
        } else {
            if savedUser?.email != email ||
                savedUser?.password != password {
                stateViewModel.value = .error(LocalizableWeatherForecast.userErrorMsg.localized)
            } else {
                stateViewModel.value = .data
                delegate?.openDashboard()
            }
        }
    }
}
