//
//  NavigationControllerSpy.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import UIKit

class NavigationControllerSpy: UINavigationController {
    var isNavigationBarHiddenCalled = false

    override func setNavigationBarHidden(_ hidden: Bool,
                                         animated: Bool) {
        isNavigationBarHiddenCalled = hidden
    }
}
