//
//  ViewCoded.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import Foundation

protocol ViewCoded {
    func addViews()
    func addConstraints()
    func setupViews()
    func setupViewCode()
}

extension ViewCoded {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
}
