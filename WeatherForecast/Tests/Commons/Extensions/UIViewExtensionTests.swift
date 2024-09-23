//
//  UIViewExtensionTests.swift
//  WeatherForecastTests
//
//  Created by J. Vitor Neves on 23/09/24.
//

import XCTest
@testable import WeatherForecast

final class UIViewExtensionTests: XCTestCase {
    
    func testSetConstraintsToParent_ShouldSetCorrectConstraints() {
        // Given
        let parentView = UIView()
        let childView = UIView()
        
        // Add child view to parent
        parentView.addSubview(childView)
        
        // Enable Auto Layout
        parentView.translatesAutoresizingMaskIntoConstraints = false
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        // When
        childView.setConstraintsToParent(parentView)
        
        // Then
        let constraints = childView.constraints
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // Check that the correct constraints are set
            XCTAssertEqual(constraints.count, 4, "There should be 4 constraints set on the child view.")
            
            let topConstraint = constraints[0] as? NSLayoutConstraint
            let leadingConstraint = constraints[1] as? NSLayoutConstraint
            let trailingConstraint = constraints[2] as? NSLayoutConstraint
            let bottomConstraint = constraints[3] as? NSLayoutConstraint
            
            XCTAssertTrue(topConstraint?.firstAnchor == childView.topAnchor, "The top anchor should be connected to the parent view's top anchor.")
            XCTAssertTrue(topConstraint?.secondAnchor == parentView.topAnchor, "The top anchor should be connected to the parent view's top anchor.")
            
            XCTAssertTrue(leadingConstraint?.firstAnchor == childView.leadingAnchor, "The leading anchor should be connected to the parent view's leading anchor.")
            XCTAssertTrue(leadingConstraint?.secondAnchor == parentView.leadingAnchor, "The leading anchor should be connected to the parent view's leading anchor.")
            
            XCTAssertTrue(trailingConstraint?.firstAnchor == childView.trailingAnchor, "The trailing anchor should be connected to the parent view's trailing anchor.")
            XCTAssertTrue(trailingConstraint?.secondAnchor == parentView.trailingAnchor, "The trailing anchor should be connected to the parent view's trailing anchor.")
            
            XCTAssertTrue(bottomConstraint?.firstAnchor == childView.bottomAnchor, "The bottom anchor should be connected to the parent view's bottom anchor.")
            XCTAssertTrue(bottomConstraint?.secondAnchor == parentView.bottomAnchor, "The bottom anchor should be connected to the parent view's bottom anchor.")
        }
    }
    
    func testSetConstraintsToParent_ShouldActivateConstraints() {
        // Given
        let parentView = UIView()
        let childView = UIView()
        
        // Add child view to parent
        parentView.addSubview(childView)
        
        // Enable Auto Layout
        parentView.translatesAutoresizingMaskIntoConstraints = false
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        // When
        childView.setConstraintsToParent(parentView)
        
        // Then
        // Check if child view's frame matches parent's bounds
        XCTAssertTrue(childView.frame == parentView.bounds, "Child view's frame should match parent's bounds after constraints are set.")
    }
}
