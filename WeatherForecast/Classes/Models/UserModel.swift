//
//  UserModel.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

class UserModel: Codable {
    var email: String
    var password: String
    
    init(email: String,
         password: String) {
        self.email = email
        self.password = password
    }
}
