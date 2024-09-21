//
//  UserManager.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    private let userKey = "userData"
    
    private init() {}
    
    func saveUser(_ user: UserModel) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: userKey)
        }
    }
    
    func getUser() -> UserModel? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(UserModel.self,
                                                     from: userData) {
                return decodedUser
            }
        }
        return nil
    }
    
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: userKey)
    }
}
