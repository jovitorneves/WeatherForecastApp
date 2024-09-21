//
//  WeatherForecastCoordinator.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import UIKit

public class WeatherForecastCoordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    private lazy var signInViewModel: SignInViewModel = {
        let viewModel = SignInViewModelConcrete(delegate: self)
        return viewModel
    }()
    private lazy var signUpViewModel: SignUpViewModel = {
        let viewModel = SignUpViewModelConcrete(delegate: self)
        return viewModel
    }()
    
    // MARK: - Constructors
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start
    public func start() {
        let view = SignInViewController(viewModel: signInViewModel)
        navigationController.setNavigationBarHidden(true,
                                                    animated: true)
        navigationController.pushViewController(view,
                                                animated: true)
    }
}

// MARK: - Extension SignInViewModelDelegate
extension WeatherForecastCoordinator: SignInViewModelDelegate {
    public func openSignUp() {
        let view = SignUpViewController(viewModel: signUpViewModel)
        navigationController.setNavigationBarHidden(false,
                                                    animated: true)
        navigationController.pushViewController(view,
                                                animated: true)
    }
    
    func openDashboard() {
        let service = WeatherForecastServiceConcrete()
        let viewModel = WeatherForecastViewModelConcrete(service: service)
        let view = WeatherForecastViewController(viewModel: viewModel)
        navigationController.setNavigationBarHidden(true,
                                                    animated: true)
        navigationController.pushViewController(view,
                                                animated: true)
    }
}

extension WeatherForecastCoordinator: SignUpViewModelDelegate {
    func popViewController() {
        navigationController.popViewController(animated: true)
        navigationController.setNavigationBarHidden(true,
                                                    animated: true)
    }
}
