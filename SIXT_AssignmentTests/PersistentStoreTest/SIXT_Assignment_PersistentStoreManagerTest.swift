//
//  SIXT_Assignment_PersistentStoreTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_PersistentStoreManagerTest: XCTestCase {
    
    var sut: PersistentStoreManager!
    
    override func setUp() {
        super.setUp()
        
        sut = PersistentStoreManager()
    }
    
    override func tearDown() {

        sut = nil
        
        super.tearDown()
    }

    func testIsListNil() {
        PersistentStoreManager.shared.clearData(StringConstants.carsKey.rawValue)
        let deliveries = PersistentStoreManager.shared.getObject(StringConstants.carsKey.rawValue, Array<Car>.self) as [Car]?
        XCTAssertNil(deliveries)
    }
    func testIsListSaved() {
        let testCar1 = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        PersistentStoreManager.shared.setObject(key: StringConstants.carsKey.rawValue, value: [testCar1])
        let cars = PersistentStoreManager.shared.getObject(StringConstants.carsKey.rawValue, Array<Car>.self) as [Car]?
        XCTAssertNotNil(cars)
    }
    
    func testIsListRetrieved() {
         let testCar1 = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        PersistentStoreManager.shared.setObject(key: StringConstants.carsKey.rawValue, value: [testCar1])
        let cars = PersistentStoreManager.shared.getObject(StringConstants.carsKey.rawValue, Array<Car>.self) as [Car]?
        XCTAssertEqual(testCar1, cars!.first!)
    }

}
