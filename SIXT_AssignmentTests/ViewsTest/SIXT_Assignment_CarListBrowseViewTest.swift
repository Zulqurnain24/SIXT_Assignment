//
//  SIXT_Assignment_CarListBrowseViewTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarListBrowseViewTest: XCTestCase {
    
    var sut: CarListBrowseView!
    
    override func setUp() {
        super.setUp()
        
        sut = CarListBrowseView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewNotNil() {

        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.activityView)
    }

    func testSetupActivityIndicator() {
       sut.setupActivityIndicator()
       XCTAssertEqual(sut.activityView.center, sut.center)
       XCTAssertEqual(sut.activityView.isAnimating, true)
    }
    
}
