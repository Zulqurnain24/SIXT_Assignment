//
//  CarBrowseVCTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarBrowseVCTest: XCTestCase {
    
    var sut: CarBrowseVC!
    
    override func setUp() {
        super.setUp()
        
        sut = CarBrowseVC()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        sut.viewDidLoad()
    }
    
    func testViewWillAppear() {
        
        sut.viewWillAppear(true)
    }
    
    func testSetupView() {
        
        sut.setupView()
    }
    
    func testRefreshList() {
        sut.fetchCarData()
    }

    func testLoadView() {
    
        sut.loadView()
        XCTAssertEqual(sut.title, StringConstants.allCars.rawValue)
    }
    
    func testStopActivityIndicator() {
        
        sut.stopActivityIndicator()
        XCTAssertNotNil(sut.getActivityIndicator())
    }

    func testPullDataFromPersistentStore() {
        let testCar1 = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        PersistentStoreManager.shared.setObject(key: StringConstants.carsKey.rawValue, value: [testCar1])
        let cars = PersistentStoreManager.shared.getObject(StringConstants.carsKey.rawValue, Array<Car>.self) as [Car]?
        XCTAssertTrue(cars!.count > 0)
    }
    
    func testUpdateTableView() {
        sut.updateTableView()
        XCTAssertNotNil(sut.getTableView())
    }
    
    func testCallWebService() {
        sut.callWebService()
    }
}
