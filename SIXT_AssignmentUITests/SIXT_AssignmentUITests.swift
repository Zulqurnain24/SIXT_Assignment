//
//  SIXT_AssignmentUITests.swift
//  SIXT_AssignmentUITests
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_AssignmentUITests: XCTestCase {
    
    let timeIntervalForInitialAnimation = 7.5
    
    func testCarListRefresh() {
       let app = XCUIApplication()
       app.launch()
       let button = app.buttons.element(boundBy: 0).firstMatch
       let exists = NSPredicate(format: "exists == 1")

       expectation(for: exists, evaluatedWith: button, handler: nil)
       waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
       button.tap()
    }
    
    func testSwipeOnList() {
       let app = XCUIApplication()
       app.launch()
       let tableView = app.tables.element(boundBy: 0).firstMatch
       let exists = NSPredicate(format: "exists == 1")

       expectation(for: exists, evaluatedWith: tableView, handler: nil)
       waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
       tableView.swipeUp()
       tableView.swipeUp()
       tableView.swipeUp()
       tableView.swipeUp()
       tableView.swipeDown()
    }
    
    func testTapOnList() {
        let app = XCUIApplication()
        app.launch()
        let tableView = app.tables.element(boundBy: 0).firstMatch
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: tableView, handler: nil)
        waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
        let cell = tableView.cells.element(boundBy: 0)
        cell.tap()
    }
    
    func testMapZooming() {
         let app = XCUIApplication()
         app.launch()
         let tableView = app.tables.element(boundBy: 0).firstMatch
         let exists = NSPredicate(format: "exists == 1")

         expectation(for: exists, evaluatedWith: tableView, handler: nil)
         waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
         let cell = tableView.cells.element(boundBy: 0)
         cell.tap()
        
         let map = app.maps.element(boundBy: 0).firstMatch

        expectation(for: exists, evaluatedWith: map, handler: nil)
        waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
        
        //Zoom In
        map.pinch(withScale: 1.5, velocity: 1.0)
        
        //Zoom Out
        map.pinch(withScale: 0.5, velocity: -1.0)
    }
    
    func testMapSwipes() {
        let app = XCUIApplication()
         app.launch()
         let tableView = app.tables.element(boundBy: 0).firstMatch
         let exists = NSPredicate(format: "exists == 1")

         expectation(for: exists, evaluatedWith: tableView, handler: nil)
         waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
         let cell = tableView.cells.element(boundBy: 0)
         cell.tap()
        
         let map = app.maps.element(boundBy: 0).firstMatch

        expectation(for: exists, evaluatedWith: map, handler: nil)
        waitForExpectations(timeout: timeIntervalForInitialAnimation, handler: nil)
        
        map.swipeUp()
        map.swipeRight()
        map.swipeDown()
        map.swipeLeft()
    }
}
