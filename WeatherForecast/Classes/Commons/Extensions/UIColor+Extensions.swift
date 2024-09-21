//
//  UIColor+Extensions.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import Foundation
import UIKit

extension UIColor {
    static let contrastColor = UIColor(named: "contrastColor",
                                       in: Bundle(for: WeatherForecastViewController.self),
                                       compatibleWith: .none)
    static let primaryColor = UIColor(named: "primaryColor",
                                      in: Bundle(for: WeatherForecastViewController.self),
                                      compatibleWith: .none)
    static let softGray = UIColor(named: "softGray",
                                  in: Bundle(for: WeatherForecastViewController.self),
                                  compatibleWith: .none)
}
