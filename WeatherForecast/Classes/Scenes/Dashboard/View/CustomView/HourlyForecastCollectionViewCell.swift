//
//  HourlyForecastCollectionViewCell.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let indentifier: String = "HourlyForecast"
    private enum Constants {
        static let oneValue: CGFloat = 1
        static let fourValue: CGFloat = 4
        static let eightValue: CGFloat = 8
        static let tenValue: CGFloat = 10
        static let fourteenValue: CGFloat = 14
        static let twentyValue: CGFloat = 20
        static let thirtyThreeValue: CGFloat = 33
    }
    
    // MARK: - Views
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,
                                                       iconImageView,
                                                       temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.fourValue
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: Constants.eightValue,
                                                                     leading: Constants.eightValue,
                                                                     bottom: Constants.eightValue,
                                                                     trailing: Constants.eightValue)
        stackView.layer.borderWidth = Constants.oneValue
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        stackView.layer.cornerRadius = Constants.twentyValue
        return stackView
    }()
    
    private(set) lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: Constants.tenValue,
                                       weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: Constants.fourteenValue,
                                       weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Constructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    // MARK: - Load
    func loadData(time: String?,
                  icon: UIImage?,
                  temp: String?) {
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
}

// MARK: - ViewCoded
extension HourlyForecastCollectionViewCell: ViewCoded {
    func addViews() {
        contentView.addSubview(stackView)
    }
    
    func addConstraints() {
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.thirtyThreeValue)
        ])
    }
    
    func setupViews() {
        // intentionally not implemented
    }
}
