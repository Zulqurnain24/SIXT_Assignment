//
//  SIXT_Assignment_CarDetailViewTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarDetailViewTest: XCTestCase {
    
    var sut: CarDetailView!
    
    override func setUp() {
        super.setUp()
        
        sut = CarDetailView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testSetConstraints() {
        sut.setConstraints()
        XCTAssertNotNil(sut)
    }
    
    func testViewNotNil() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.map)
    }
    
    func testDescriptionLabelText() {
          let testCar = Car(id: "0", modelIdentifier: "0", make: "BMW", modelName: "MINI", name: "Vanessa", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", transmission: "M", licensePlate: "M-VO0259", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", fuelLevel: 0.7)
        sut.nameLabel.text = "Name: \(testCar.name)"
        sut.modelNameLabel.text = "Model: \(testCar.modelName)"
        sut.makeNameLabel.text = "Make: \(testCar.make)"
        sut.transmissionTypeLabel.text = "Transmission: \(testCar.transmission)"
        sut.fuelLevelLabel.text = "Fuel Level: \(testCar.fuelLevel)"
        sut.fuelTypeLabel.text = "Fuel Type: \(testCar.fuelType)"
        sut.colorLabel.text = "Color: \(testCar.color)"
        sut.cleanlinessLabel.text = "Cleanliness: \(testCar.innerCleanliness)"
        sut.numberPlatLabel.text = "License Plate: \(testCar.licensePlate)"

         XCTAssertEqual(sut.nameLabel.text, "Name: \(testCar.name)")
         XCTAssertEqual(sut.modelNameLabel.text, "Model: \(testCar.modelName)")
        XCTAssertEqual(sut.makeNameLabel.text, "Make: \(testCar.make)")
        XCTAssertEqual(sut.transmissionTypeLabel.text, "Transmission: \(testCar.transmission)")
        XCTAssertEqual(sut.fuelLevelLabel.text, "Fuel Level: \(testCar.fuelLevel)")
        XCTAssertEqual(sut.fuelTypeLabel.text, "Fuel Type: \(testCar.fuelType)")
        XCTAssertEqual(sut.colorLabel.text, "Color: \(testCar.color)")
        XCTAssertEqual(sut.cleanlinessLabel.text, "Cleanliness: \(testCar.innerCleanliness)")
         XCTAssertEqual(sut.numberPlatLabel.text, "License Plate: \(testCar.licensePlate)")
        XCTAssertEqual(sut.imageView.image, UIImage(named: StringConstants.defaultImage.rawValue))
       
    }
    
    func testDistanceSpan() {
        XCTAssertEqual(
            sut.distanceSpan, 500)
    }
    
    func testImageView() {
       sut.imageView.image = UIImage(named: StringConstants.defaultImage.rawValue)
        XCTAssertEqual(UIImage(named: StringConstants.defaultImage.rawValue)?.jpegData(compressionQuality: 1.0), sut.imageView.image?.jpegData(compressionQuality: 1.0))
    }
    
    func testRegionRadius() {
        XCTAssertEqual(sut.regionRadius, 500.0)
    }
   
}
