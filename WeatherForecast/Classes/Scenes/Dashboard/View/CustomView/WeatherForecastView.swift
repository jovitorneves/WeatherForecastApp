//
//  WeatherForecastView.swift
//  WeatherForecast
//
//  Created by J. Vitor Neves on 20/09/24.
//

import UIKit

class WeatherForecastView: UIView {
    
    // MARK: - Views
    private(set) lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.contrastColor
        view.layer.cornerRadius = Constants.twentyValue
        return view
    }()
    
    private(set) lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.twentyValue)
        label.textAlignment = .center
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private(set) lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.seventyValue,
                                       weight: .bold)
        label.textAlignment = .left
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private(set) lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableWeatherForecast.humidityLabel.localized
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private(set) lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private(set) lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel,
                                                       humidityValueLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableWeatherForecast.windLabel.localized
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private(set) lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private(set) lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel,
                                                       windValueLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var statusStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView,
                                                       windStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Constants.threeValue
        stackView.backgroundColor = UIColor.softGray
        stackView.layer.cornerRadius = Constants.tenValue
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: Constants.twelveValue,
                                                                     leading: Constants.twentyFourValue,
                                                                     bottom: Constants.twelveValue,
                                                                     trailing: Constants.twentyFourValue)
        return stackView
    }()
    
    private(set) lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.text = LocalizableWeatherForecast.hourlyForecastLabel.localized
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.sixtySevenValue,
                                 height: Constants.eightyFourValue)
        layout.sectionInset = UIEdgeInsets(top: .zero,
                                           left: Constants.twelveValue,
                                           bottom: .zero,
                                           right: Constants.twelveValue)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(HourlyForecastCollectionViewCell.self,
                                forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.indentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private(set) lazy var dailyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.text = LocalizableWeatherForecast.dailyForecastLabel.localized
        label.font = UIFont.systemFont(ofSize: Constants.twelveValue,
                                       weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var dailyForecastTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DailyForecastTableViewCell.self,
                           forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        tableView.separatorColor = UIColor.contrastColor
        return tableView
    }()
    
    // MARK: - Properties
    private var viewModel: WeatherForecastViewModel
    private var forecastResponse: ForecastResponse?
    private enum Constants {
        static let threeValue: CGFloat = 3
        static let eightValue: CGFloat = 8
        static let tenValue: CGFloat = 10
        static let twelveValue: CGFloat = 12
        static let fifteenValue: CGFloat = 15
        static let eighteenValue: CGFloat = 18
        static let twentyValue: CGFloat = 20
        static let twentyFourValue: CGFloat = 24
        static let thirtyValue: CGFloat = 30
        static let thirtyFiveValue: CGFloat = 35
        static let sixtyValue: CGFloat = 60
        static let sixtySevenValue: CGFloat = 67
        static let seventyValue: CGFloat = 70
        static let eightyFourValue: CGFloat = 84
        static let oneHundredFiftyValue: CGFloat = 150
        static let twoHundredSixValue: CGFloat = 206
        static let backgroundDay: String = "background-day"
        static let backgroundNight: String = "background-night"
    }
    
    init(viewModel: WeatherForecastViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init(coder: NSCoder) {
        fatalError(LocalizableWeatherForecast.initView.localized)
    }
    
    // MARK: - Load
    func loadData(forecastResponse: ForecastResponse?,
                  city: CityModel?) {
        self.forecastResponse = forecastResponse
        
        cityLabel.text = city?.name ?? String()
        temperatureLabel.text = forecastResponse?.current.temp.toCelsius()
        humidityValueLabel.text = "\(forecastResponse?.current.humidity ?? .zero)mm"
        windValueLabel.text = "\(forecastResponse?.current.windSpeed ?? .zero)km/h"
        weatherIcon.setBackgroundImage(named: forecastResponse?.current.weather.first?.icon ?? String())
        
        if forecastResponse?.current.dt.isDayTime() ?? true {
            backgroundView.setBackgroundImage(named: Constants.backgroundDay)
        } else {
            backgroundView.setBackgroundImage(named: Constants.backgroundNight)
        }
        
        hourlyCollectionView.reloadData()
        dailyForecastTableView.reloadData()
    }
}

// MARK: - ViewCoded
extension WeatherForecastView: ViewCoded {
    func addViews() {
        addSubview(backgroundView)
        addSubview(headerView)
        addSubview(statusStackView)
        addSubview(hourlyForecastLabel)
        addSubview(hourlyCollectionView)
        addSubview(dailyForecastLabel)
        addSubview(dailyForecastTableView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
    }
    
    func addConstraints() {
        setupConstraintsBackgroundView()
        setupConstraintsHeaderView()
        setupConstraintsCityLabel()
        setupConstraintsTemperatureLabel()
        setupConstraintsWeatherIcon()
        setupConstraintsStatusStackView()
        setupConstraintsHourlyForecastLabel()
        setupConstraintsHourlyCollectionView()
        setupConstraintsDailyForecastLabel()
        setupConstraintsDailyForecastTableView()
    }
    
    private func setupConstraintsBackgroundView() {
        addConstraints([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupConstraintsHeaderView() {
        addConstraints([
            headerView.topAnchor.constraint(equalTo: topAnchor,
                                            constant: Constants.sixtyValue),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Constants.thirtyFiveValue),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -Constants.thirtyFiveValue),
            headerView.heightAnchor.constraint(equalToConstant: Constants.oneHundredFiftyValue)
        ])
    }
    
    private func setupConstraintsCityLabel() {
        addConstraints([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor,
                                           constant: Constants.fifteenValue),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                               constant: Constants.fifteenValue),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,
                                                constant: -Constants.fifteenValue),
            cityLabel.heightAnchor.constraint(equalToConstant: Constants.twentyValue)
        ])
    }
    
    private func setupConstraintsTemperatureLabel() {
        addConstraints([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,
                                                  constant: Constants.twelveValue),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                                      constant: Constants.eighteenValue),
            temperatureLabel.heightAnchor.constraint(equalToConstant: Constants.seventyValue)
        ])
    }
    
    private func setupConstraintsWeatherIcon() {
        addConstraints([
            weatherIcon.heightAnchor.constraint(equalToConstant: Constants.eightyFourValue),
            weatherIcon.widthAnchor.constraint(equalToConstant: Constants.eightyFourValue),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,
                                                  constant: -Constants.eighteenValue),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor,
                                                 constant: Constants.eightValue)
        ])
    }
    
    private func setupConstraintsStatusStackView() {
        addConstraints([
            statusStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor,
                                                 constant: Constants.twentyFourValue),
            statusStackView.widthAnchor.constraint(equalToConstant: Constants.twoHundredSixValue),
            statusStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupConstraintsHourlyForecastLabel() {
        addConstraints([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statusStackView.bottomAnchor,
                                                     constant: Constants.thirtyValue),
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: Constants.thirtyFiveValue),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -Constants.thirtyFiveValue)
        ])
    }
    
    private func setupConstraintsHourlyCollectionView() {
        addConstraints([
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor,
                                                      constant: Constants.twentyFourValue),
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: Constants.eightyFourValue),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupConstraintsDailyForecastLabel() {
        addConstraints([
            dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor,
                                                    constant: Constants.thirtyValue),
            dailyForecastLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                        constant: Constants.thirtyFiveValue),
            dailyForecastLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                         constant: -Constants.thirtyFiveValue)
        ])
    }
    
    private func setupConstraintsDailyForecastTableView() {
        addConstraints([
            dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor,
                                                        constant: Constants.fifteenValue),
            dailyForecastTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dailyForecastTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyForecastTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupViews() {
        backgroundColor = .white
    }
}

// MARK: - UICollectionViewDataSource
extension WeatherForecastView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        forecastResponse?.hourly.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.indentifier,
                                                            for: indexPath) as? HourlyForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let forecast = forecastResponse?.hourly[indexPath.row]
        cell.loadData(time: forecast?.dt.toHourFormat(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? String(),
                                    in: Bundle(for: WeatherForecastViewController.self),
                                    compatibleWith: .none),
                      temp: forecast?.temp.toCelsius())
        return cell
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WeatherForecastView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        forecastResponse?.daily.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier,
                                                       for: indexPath) as? DailyForecastTableViewCell else {
            return UITableViewCell()
        }
        
        let forecast = forecastResponse?.daily[indexPath.row]
        cell.loadData(weekDay: forecast?.dt.toWeekdayName().uppercased(),
                      min: forecast?.temp.min.toCelsius(),
                      max: forecast?.temp.max.toCelsius(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? String(),
                                    in: Bundle(for: WeatherForecastViewController.self),
                                    compatibleWith: .none))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.sixtyValue
    }
}
