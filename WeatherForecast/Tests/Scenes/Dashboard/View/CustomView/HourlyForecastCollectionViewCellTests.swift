//
//  HourlyForecastCollectionViewCellTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

class HourlyForecastCollectionViewCellTests: XCTestCase {

    var cell: HourlyForecastCollectionViewCell!

    override func setUp() {
        super.setUp()
        cell = HourlyForecastCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }

    func testCellInitialization() {
        // Check if the main components are not nil
        XCTAssertNotNil(cell.stackView)
        XCTAssertNotNil(cell.hourLabel)
        XCTAssertNotNil(cell.iconImageView)
        XCTAssertNotNil(cell.temperatureLabel)

        // Check the initial properties of the labels
        XCTAssertEqual(cell.hourLabel.textColor, UIColor.contrastColor)
        XCTAssertEqual(cell.temperatureLabel.textColor, UIColor.contrastColor)
        XCTAssertEqual(cell.hourLabel.font, UIFont.systemFont(ofSize: 10, weight: .semibold))
        XCTAssertEqual(cell.temperatureLabel.font, UIFont.systemFont(ofSize: 14, weight: .semibold))
    }

    func testLoadDataUpdatesUI() {
        // Given
        let time = "12:00 PM"
        let temperature = "22°C"
        let image = UIImage(systemName: "sun.max") // or any valid image for testing

        // When
        cell.loadData(time: time,
                      icon: image,
                      temp: temperature,
                      index: .zero)

        // Then
        XCTAssertEqual(cell.hourLabel.text, time)
        XCTAssertEqual(cell.temperatureLabel.text, temperature)
        XCTAssertEqual(cell.iconImageView.image, image)
    }

    func testConstraintsSetup() {
        // Adding the cell to a superview for layout testing
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        superView.addSubview(cell)

        cell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            cell.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            cell.topAnchor.constraint(equalTo: superView.topAnchor),
            cell.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])

        // Trigger layout
        superView.layoutIfNeeded()

        XCTAssertTrue(cell.stackView.isDescendant(of: cell.contentView))
        XCTAssertEqual(cell.iconImageView.frame.height, 33)
    }
}
