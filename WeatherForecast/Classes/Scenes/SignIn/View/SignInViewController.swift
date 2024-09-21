//
//  WeatherForecastViewController.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Custom Views
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .zero
        stackView.layoutMargins = .init(top: .zero, 
                                        left: .zero,
                                        bottom: .zero,
                                        right: .zero)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var signInView: SignInView = {
        let view = SignInView(viewModel: self.viewModel)
        return view
    }()
    
    // MARK: - Properties
    private var viewModel: SignInViewModel
    
    // MARK: - Constructors
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    // MARK: - Cicly life
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
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
}

extension SignInViewController: ViewCoded {
    func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(signInView)
    }
    
    func addConstraints() {
        setupContraintsStackView()
    }
    
    func setupViews() {
        view.backgroundColor = .primaryColor
    }
    
    func setupContraintsStackView() {
        view.addConstraints([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - ViewModel Binding
extension SignInViewController {
    func bindViewModelStateViewModel() {
        viewModel.stateViewModel.bind { [weak self] stateViewModel in
            guard let stateViewModel else { return }
            switch stateViewModel {
            case .error(let error):
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
            case .data:
                break
            }
        }
    }
}
