//
//  SIXT_Assignment_CoordinateTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CoordinateTest: XCTestCase {
    
    var sut: CarCoordinate!
    
    override func setUp() {
        super.setUp()
        sut = CarCoordinate(name: "Test Coordinate", lat: 0.0, long: 0.0)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeliveryCoordinate() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, "Test Coordinate")
        XCTAssertEqual(sut.coordinate.latitude, 0.0)
        XCTAssertEqual(sut.coordinate.longitude, 0.0)
    }
}
