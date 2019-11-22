//
//  SIXT_Assignment_CarCellTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarCellTest: XCTestCase {
    
    var sut: CarCell!
    
    override func setUp() {
        super.setUp()
        
        sut = CarCell()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewNotNil() {
         let testCar = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        sut.configure(id: testCar.id, modelIdentifier: testCar.modelIdentifier, makeName: testCar.make, modelName: testCar.modelName, name: testCar.name, group: testCar.group, color: testCar.color, series: testCar.series, fuelType: testCar.fuelType, transmission: testCar.transmission, licensePlate: testCar.licensePlate, carImageUrl: testCar.carImageUrl, latitude: testCar.latitude, longitude: testCar.longitude, innerCleanliness: testCar.innerCleanliness, fuelLevel: testCar.fuelLevel)
        XCTAssertEqual(testCar.id, "0")
        XCTAssertEqual(testCar.modelIdentifier, "0")
        XCTAssertEqual(testCar.make, "BMW")
        XCTAssertEqual(testCar.modelName, "MINI")
        XCTAssertEqual(testCar.name, "Vanessa")
        XCTAssertEqual(testCar.group, "MINI")
        XCTAssertEqual(testCar.color, "midnight_black")
        XCTAssertEqual(testCar.series, "MINI")
        XCTAssertEqual(testCar.fuelType, "D")
        XCTAssertEqual(testCar.transmission, "M")
        XCTAssertEqual(testCar.licensePlate, "M-VO0259")
        XCTAssertEqual(testCar.carImageUrl, "https://cdn.sixt.io/codingtask/images/mini.png")
        XCTAssertEqual(testCar.latitude, 48.134557)
        XCTAssertEqual(testCar.longitude, 11.576921)
        XCTAssertEqual(testCar.innerCleanliness, "REGULAR")
        XCTAssertEqual(testCar.fuelLevel, 0.7)
        XCTAssertEqual(sut.imageView?.image?.jpegData(compressionQuality: 1.0), UIImage(named: StringConstants.defaultImage.rawValue)?.jpegData(compressionQuality: 1.0))
    }


}
