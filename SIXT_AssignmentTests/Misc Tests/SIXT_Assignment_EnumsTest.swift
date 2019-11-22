//
//  CarsListEnumsTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import SIXT_Assignment

class SIXT_Assignment_EnumsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnums() {

        XCTAssertEqual(DoubleConstants.animationDuration.rawValue, 4.0)
        XCTAssertEqual(DoubleConstants.cellImageRatio.rawValue, 0.65)
        XCTAssertEqual(DoubleConstants.detailImageRatio.rawValue, 0.35)
        XCTAssertEqual(DoubleConstants.coordinateDistance.rawValue, 5000.0)
        
        XCTAssertEqual( StringConstants.internetErrorTitleText.rawValue, "Error")
        XCTAssertEqual( StringConstants.carBrowseVCTitle.rawValue, "Delivery List")
        XCTAssertEqual( StringConstants.internetErrorMessageText.rawValue, "Please connect to internet.")
        XCTAssertEqual( StringConstants.serviceUnavailable.rawValue, "It seems service is unavailable temporarily. Please try again later")
        XCTAssertEqual( StringConstants.carsKey.rawValue, "deliveries")
        XCTAssertEqual( StringConstants.issueWithTheServer.rawValue, "It seems there is an issue with the server at the moment. Please try later")
        XCTAssertEqual( StringConstants.persistentStoreData.rawValue, "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data")
        XCTAssertEqual( StringConstants.bmwMiniCooper.rawValue, "../SceneKitAssetCatalog/mini.scn")
        XCTAssertEqual( StringConstants.defaultImage.rawValue, "defaultImage")
        XCTAssertEqual( StringConstants.refreshButton.rawValue, "refreshButton")
        XCTAssertEqual( StringConstants.name.rawValue, "Name:")
        XCTAssertEqual( StringConstants.model.rawValue,"Model:")
        XCTAssertEqual( StringConstants.make.rawValue, "Make:")
        XCTAssertEqual( StringConstants.transmission.rawValue, "Transmission:")
        XCTAssertEqual( StringConstants.fuelLevel.rawValue, "Fuel Level:")
        XCTAssertEqual( StringConstants.fuelType.rawValue, "Fuel Type:")
        XCTAssertEqual( StringConstants.color.rawValue, "Color:")
        XCTAssertEqual( StringConstants.cleanliness.rawValue, "Cleanliness:")
        XCTAssertEqual( StringConstants.licensePlate.rawValue, "License Plate:")
        XCTAssertEqual( StringConstants.carDetails.rawValue, "Car Details")
        XCTAssertEqual( StringConstants.allCars.rawValue, "All Cars")
        XCTAssertEqual( StringConstants.errorDownloadingImage.rawValue, "Error downloading image")
        XCTAssertEqual( StringConstants.carCoordinateIdentifier.rawValue, "car location")

    }
}
