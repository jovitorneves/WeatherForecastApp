//
//  DailyForecastTableViewCellTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import Foundation
import XCTest
@testable import WeatherForecast

class DailyForecastTableViewCellTests: XCTestCase {
    
    var cell: DailyForecastTableViewCell!

    override func setUp() {
        super.setUp()
        cell = DailyForecastTableViewCell(style: .default, reuseIdentifier: DailyForecastTableViewCell.identifier)
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }

    func testCellInitialization() {
        // Check if the main components are not nil
        XCTAssertNotNil(cell.weekDayLabel)
        XCTAssertNotNil(cell.minTemperatureLabel)
        XCTAssertNotNil(cell.maxTemperatureLabel)
        XCTAssertNotNil(cell.iconImageView)
        XCTAssertNotNil(cell.stackView)

        // Check the initial properties of the labels
        XCTAssertEqual(cell.weekDayLabel.textColor, UIColor.contrastColor)
        XCTAssertEqual(cell.minTemperatureLabel.textColor, UIColor.contrastColor)
        XCTAssertEqual(cell.maxTemperatureLabel.textColor, UIColor.contrastColor)
        XCTAssertEqual(cell.weekDayLabel.font, UIFont.systemFont(ofSize: 12, weight: .semibold))
    }

    func testLoadDataUpdatesUI() {
        // Given
        let weekDay = "Monday"
        let minTemp = "10°C"
        let maxTemp = "20°C"
        let image = UIImage(systemName: "sun.max") // or any valid image for testing

        // When
        cell.loadData(weekDay: weekDay, min: minTemp, max: maxTemp, icon: image)

        // Then
        XCTAssertEqual(cell.weekDayLabel.text, weekDay)
        XCTAssertEqual(cell.minTemperatureLabel.text, "min \(minTemp)")
        XCTAssertEqual(cell.maxTemperatureLabel.text, "max \(maxTemp)")
        XCTAssertEqual(cell.iconImageView.image, image)
    }

    func testConstraintsSetup() {
        // Adding the cell to a superview for layout testing
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        superView.addSubview(cell)

        // Trigger layout
        cell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            cell.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            cell.topAnchor.constraint(equalTo: superView.topAnchor),
            cell.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])

        // Trigger layout pass
        superView.layoutIfNeeded()

        // Here you could check if the constraints are set correctly or check specific frame sizes
        XCTAssertTrue(cell.stackView.isDescendant(of: cell.contentView))
        XCTAssertTrue(cell.weekDayLabel.frame.width <= 50)
    }
}
