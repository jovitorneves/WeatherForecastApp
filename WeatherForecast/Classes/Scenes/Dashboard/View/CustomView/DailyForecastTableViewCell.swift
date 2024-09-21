//
//  DailyForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 21/09/24.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DailyForecast"
    private enum Constants {
        static let twelveValue: CGFloat = 12
        static let fifteenValue: CGFloat = 15
        static let sixteenValue: CGFloat = 16
        static let fiftyValue: CGFloat = 50
    }
    
    // MARK: - Views
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel,
                                                       iconImageView,
                                                       minTemperatureLabel,
                                                       maxTemperatureLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: Constants.sixteenValue,
                                                                     leading: Constants.sixteenValue,
                                                                     bottom: Constants.sixteenValue,
                                                                     trailing: Constants.sixteenValue)
        stackView.spacing = Constants.fifteenValue
        return stackView
    }()
    
    // MARK: - Constructors
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    // MARK: - Load
    func loadData(weekDay: String?,
                  min: String?,
                  max: String?,
                  icon: UIImage?) {
        weekDayLabel.text = weekDay
        minTemperatureLabel.text = "min \(min ?? "")"
        maxTemperatureLabel.text = "max \(max ?? "")"
        iconImageView.image = icon
    }
}

// MARK: - ViewCoded
extension DailyForecastTableViewCell: ViewCoded {
    func addViews() {
        contentView.addSubview(stackView)
    }
    
    func addConstraints() {
        addConstraints([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.fiftyValue)
        ])
        stackView.setConstraintsToParent(contentView)
    }
    
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
