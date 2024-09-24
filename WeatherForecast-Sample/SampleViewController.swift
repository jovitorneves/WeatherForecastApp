//
//  SampleViewController.swift
//  WeatherForecast-Sample
//
//  Created by J. Vitor Neves on 19/09/24.
//

import UIKit
import WeatherForecast

class SampleViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var openButton: UIButton!
    
    // MARK: - Properties
    private var coordinator: WeatherForecastCoordinator?
    
    // MARK: - Cicly life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator = WeatherForecastCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        openButton?.accessibilityIdentifier = "openFrameworkButton"
    }
    
    // MARK: - Actions
    @IBAction func openButtonAction(_ sender: UIButton) {
        coordinator?.start()
    }
}
