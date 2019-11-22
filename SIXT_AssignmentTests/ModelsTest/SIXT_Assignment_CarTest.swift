//
//  SIXT_Assignment_CarTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarTest: XCTestCase {
    
    var sut: Car!
    
    override func setUp() {
        super.setUp()
        sut = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertNotNil(sut)
      
        XCTAssertEqual( sut?.id, "0")
        XCTAssertEqual( sut?.modelIdentifier, "0")
        XCTAssertEqual( sut?.modelName, "MINI")
        XCTAssertEqual( sut?.name, "Vanessa")
        XCTAssertEqual( sut?.group, "MINI")
        XCTAssertEqual( sut?.color, "midnight_black")
        XCTAssertEqual( sut?.series, "MINI")
        XCTAssertEqual( sut?.fuelType, "D")
        XCTAssertEqual( sut?.transmission, "M")
        XCTAssertEqual( sut?.latitude, 48.134557)
        XCTAssertEqual( sut?.longitude, 11.576921)
    }
}
