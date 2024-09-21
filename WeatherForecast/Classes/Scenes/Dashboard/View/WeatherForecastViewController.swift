//
//  WeatherForecastViewController.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import UIKit

class WeatherForecastViewController: UIViewController {

    // MARK: - Custom Views
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .zero
        stackView.layoutMargins = .init(top: .zero,
                                        left: .zero,
                                        bottom: .zero,
                                        right: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var weatherForecastView: WeatherForecastView = {
        let view = WeatherForecastView(viewModel: self.viewModel)
        return view
    }()
    
    private(set) lazy var loaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private(set) lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    // MARK: - Properties
    private var viewModel: WeatherForecastViewModel
    private var cityModel = CityModel(lat: "-23.5802765",
                                      lon: "-46.6630635",
                                      name: "São Paulo")
    
    // MARK: - Constructors
    init(viewModel: WeatherForecastViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    // MARK: - Cicly life
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        setupViewCode()
        viewModel.fetchWeather(model: cityModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModelStateViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.stateViewModel.unbindAll()
    }
    
    // MARK: - Loader
    private func showLoader() {
        loaderView.isHidden = false
        loader.startAnimating()
    }
    
    private func hideLoader() {
        loaderView.isHidden = true
        loader.stopAnimating()
    }
}

extension WeatherForecastViewController: ViewCoded {
    func addViews() {
        view.addSubview(stackView)
        view.addSubview(loaderView)
        loaderView.addSubview(loader)
    }
    
    func addConstraints() {
        setupContraintsStackView()
        setupContraintsLoaderView()
        setupContraintsLoader()
    }
    
    func setupViews() {
        view.backgroundColor = .white
    }
    
    func setupContraintsStackView() {
        view.addConstraints([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupContraintsLoaderView() {
        view.addConstraints([
            loaderView.topAnchor.constraint(equalTo: view.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupContraintsLoader() {
        view.addConstraints([
            loader.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor)
        ])
    }
}

// MARK: - ViewModel Binding
extension WeatherForecastViewController {
    func bindViewModelStateViewModel() {
        viewModel.stateViewModel.bind { [weak self] stateViewModel in
            guard let stateViewModel else { return }
            switch stateViewModel {
            case .error(let error):
                DispatchQueue.main.async {
                    self?.hideLoader()
                    let alert = UIAlertController(title: LocalizableWeatherForecast.titleAppLabel.localized,
                                                  message: error,
                                                  preferredStyle: .alert)
                            
                    let okAction = UIAlertAction(title: LocalizableWeatherForecast.alertButton.localized,
                                                 style: .default,
                                                 handler: nil)
                    alert.addAction(okAction)
                    
                    self?.present(alert,
                                  animated: true,
                                  completion: nil)
                }
            case .data(let weatherForecast):
                DispatchQueue.main.async {
                    self?.hideLoader()
                    if !(self?.stackView.arrangedSubviews.contains(self?.weatherForecastView ?? UIView()) ?? false) {
                        self?.stackView.addArrangedSubview(self?.weatherForecastView ?? UIView())
                    }
                    self?.weatherForecastView.loadData(forecastResponse: weatherForecast,
                                                       city: self?.cityModel)
                }
            case .loading:
                DispatchQueue.main.async {
                    self?.showLoader()
                    self?.stackView.removeArrangedSubview(self?.weatherForecastView ?? UIView())
                }
            }
        }
    }
}
