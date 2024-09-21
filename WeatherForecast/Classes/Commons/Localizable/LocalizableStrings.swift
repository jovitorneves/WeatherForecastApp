//
//  LocalizableStrings.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import Foundation

protocol Localizable {
    var table: String { get }
    var localized: String { get }
    func localized(with paramenters: CVarArg...) -> String
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    
    var localized: String {
        Bundle(for: WeatherForecastViewController.self)
            .localizedString(forKey: rawValue,
                             value: nil,
                             table: table)
    }
    
    func localized(with paramenters: CVarArg...) -> String {
        String(format: localized, arguments: paramenters)
    }
}
