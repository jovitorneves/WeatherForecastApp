//
//  UIImage+Extensions.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 21/09/24.
//

import UIKit

extension UIImageView {
    func setBackgroundImage(named imageName: String) {
        self.image = UIImage(named: imageName,
                             in: Bundle(for: WeatherForecastViewController.self),
                             compatibleWith: nil)
    }
}
