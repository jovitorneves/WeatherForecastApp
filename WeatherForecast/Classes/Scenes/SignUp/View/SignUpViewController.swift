//
//  SignUpViewController.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Custom Views
    private(set) lazy var stackView: UIStackView = {
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
    
    private(set) lazy var signInView: SignUpView = {
        let view = SignUpView(viewModel: self.viewModel)
        return view
    }()
    
    // MARK: - Properties
    private var viewModel: SignUpViewModel
    
    // MARK: - Constructors
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModelIsSuccess()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.isSuccess.unbindAll()
    }
}

extension SignUpViewController: ViewCoded {
    func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(signInView)
    }
    
    func addConstraints() {
        setupContraintsStackView()
    }
    
    func setupViews() {
        view.backgroundColor = .primaryColor
        title = LocalizableWeatherForecast.titleAppLabel.localized
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
extension SignUpViewController {
    func bindViewModelIsSuccess() {
        viewModel.isSuccess.bind { [weak self] isSuccess in
            if isSuccess {
                return
            }
            let alert = UIAlertController(title: LocalizableWeatherForecast.titleAppLabel.localized,
                                          message: LocalizableWeatherForecast.alertMessage.localized,
                                          preferredStyle: .alert)
                    
            let okAction = UIAlertAction(title: LocalizableWeatherForecast.alertButton.localized,
                                         style: .default,
                                         handler: nil)
            alert.addAction(okAction)
            
            self?.present(alert,
                          animated: true,
                          completion: nil)
        }
    }
}
