//
//  SignInView.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 19/09/24.
//

import UIKit

class SignInView: UIView {
    
    // MARK: - Views
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        stackView.layoutMargins = .init(top: Constants.sixteenValue,
                                        left: Constants.sixteenValue,
                                        bottom: Constants.sixteenValue,
                                        right: Constants.sixteenValue)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var titleSignIn: UILabel = {
        let label = UILabel()
        label.text = LocalizableWeatherForecast.titleAppLabel.localized
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = LocalizableWeatherForecast.titleScreenAccessibilityIdentifier.localized
        return label
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = LocalizableWeatherForecast.emailPlaceholder.localized
        textField.accessibilityIdentifier = LocalizableWeatherForecast.emailTextFieldAccessibilityIdentifier.localized
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = LocalizableWeatherForecast.passwordPlaceholder.localized
        textField.accessibilityIdentifier = LocalizableWeatherForecast.passwordTextFieldAccessibilityIdentifier.localized
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LocalizableWeatherForecast.signUpButton.localized,
                        for: .normal)
        button.addTarget(self, action: #selector(openSignUpAction),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .contrastColor
        button.layer.cornerRadius = Constants.twentyValue
        button.accessibilityIdentifier = LocalizableWeatherForecast.signUpButtonAccessibilityIdentifier.localized
        return button
    }()
    
    private(set) lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LocalizableWeatherForecast.signInButton.localized,
                        for: .normal)
        button.addTarget(self, action: #selector(validationLoginAction),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .contrastColor
        button.layer.cornerRadius = Constants.twentyValue
        button.accessibilityIdentifier = LocalizableWeatherForecast.signInButtonAccessibilityIdentifier.localized
        return button
    }()
    
    // MARK: - Properties
    private var viewModel: SignInViewModel
    private enum Constants {
        static let pointTwoFiveValue: CGFloat = 0.25
        static let stackViewSpacing: CGFloat = 10
        static let sixteenValue: CGFloat = 16
        static let twentyValue: CGFloat = 20
        static let fortyEightValue: CGFloat = 48
    }
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    @objc
    private func openSignUpAction() {
        viewModel.openSignUp()
    }
    
    @objc
    private func validationLoginAction() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        viewModel.validationLogin(email: email,
                                  password: password)
    }
}

// MARK: - ViewCoded
extension SignInView: ViewCoded {
    func addViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        contentView.addSubview(signUpButton)
        contentView.addSubview(signInButton)
        stackView.addArrangedSubview(titleSignIn)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
    }
    
    func addConstraints() {
        var scrollHeightAnchor: NSLayoutDimension
        var scrollWidthAnchor: NSLayoutDimension
        scrollHeightAnchor = contentView.heightAnchor
        scrollWidthAnchor = safeAreaLayoutGuide.widthAnchor
        
        let contentHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollHeightAnchor)
        contentHeightConstraints.priority = .defaultLow
        let contentWidthConstraints = contentView.widthAnchor.constraint(equalTo: scrollWidthAnchor)
        contentWidthConstraints.priority = .required
        
        addConstraints([
            contentHeightConstraints,
            contentWidthConstraints
        ])
        
        setupConstraintsScrollView()
        setupConstraintsContentView()
        setupConstraintsStackView()
        setupConstraintsSignUpButton()
        setupConstraintsSignInButton()
    }
    
    private func setupConstraintsScrollView() {
        addConstraints([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupConstraintsContentView() {
        addConstraints([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupConstraintsStackView() {
        addConstraints([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,
                                               constant: contentView.frame.height * Constants.pointTwoFiveValue),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupConstraintsSignUpButton() {
        addConstraints([
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.fortyEightValue),
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                              constant: Constants.sixteenValue),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: Constants.sixteenValue),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -Constants.sixteenValue),
            signUpButton.bottomAnchor.constraint(greaterThanOrEqualTo: signInButton.topAnchor,
                                                 constant: -Constants.sixteenValue)
        ])
    }
    
    private func setupConstraintsSignInButton() {
        addConstraints([
            signInButton.heightAnchor.constraint(equalToConstant: Constants.fortyEightValue),
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,
                                              constant: Constants.sixteenValue),
            signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: Constants.sixteenValue),
            signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -Constants.sixteenValue),
            signInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: Constants.sixteenValue)
        ])
    }
    
    func setupViews() {
        // intentionally not implemented
    }
}
