//
//  SIXT_Assignment_CarsListTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarsListTest: XCTestCase {
    
    var sut: CarsList!
    
    override func setUp() {
        super.setUp()
        let testCar1 = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        sut = CarsList([testCar1])
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeliveries() {
        XCTAssertEqual( sut.getCars().count, 1)
        XCTAssertEqual( sut.getCars().first?.id, "0")
        XCTAssertEqual( sut.getCars().first?.modelIdentifier, "0")
        XCTAssertEqual( sut.getCars().first?.modelName, "MINI")
        XCTAssertEqual( sut.getCars().first?.name, "Vanessa")
        XCTAssertEqual( sut.getCars().first?.group, "MINI")
        XCTAssertEqual( sut.getCars().first?.color, "midnight_black")
        XCTAssertEqual( sut.getCars().first?.series, "MINI")
        XCTAssertEqual( sut.getCars().first?.fuelType, "D")
        XCTAssertEqual( sut.getCars().first?.transmission, "M")
        XCTAssertEqual( sut.getCars().first?.latitude, 48.134557)
        XCTAssertEqual( sut.getCars().first?.longitude, 11.576921)
        sut.removeAll()
        XCTAssertEqual( sut.getCars().count, 0)
    }
}
