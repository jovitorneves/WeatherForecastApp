//
//  SignUpViewModelConcrete.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

class SignUpViewModelConcrete {
    
    var isSuccess: Bindable<Bool> = Bindable(false)
    
    private weak var delegate: SignUpViewModelDelegate?
    
    init(delegate: SignUpViewModelDelegate?) {
        self.delegate = delegate
    }
}

extension SignUpViewModelConcrete: SignUpViewModel {
    func validationRegister(email: String,
                            password: String,
                            confirmPassword: String) {
        let isValidPassword = password != confirmPassword
        if email.isEmpty ||
            password.isEmpty ||
            confirmPassword.isEmpty ||
            !email.isValidEmail() ||
            !password.isValidPassword() ||
            !confirmPassword.isValidPassword() ||
            isValidPassword {
            isSuccess.value = false
        } else {
            let model = UserModel(email: email,
                                  password: password)
            UserManager.shared.saveUser(model)
            isSuccess.value = true
            delegate?.popViewController()
        }
    }
}
