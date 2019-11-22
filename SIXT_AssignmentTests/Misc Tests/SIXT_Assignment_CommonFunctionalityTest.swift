//
//  CarListCommonFunctionalityTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CommonFunctionalityTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPresentAlert1() {
        CommonFunctionality.presentAlert(viewController: CarBrowseVC(), title: "Test Title", message: "Test Message")
    }
    
    func testpresentAlert2() {
        CommonFunctionality.presentAlert(viewController: CarBrowseVC(), title: "Test Title", message: "Test Message", callbackOnAffirmation: {}, callbackOnNegation: {})
    }
    
    func testResizeImage() {
        guard let testImage = UIImage(named:"placeHolder") else { return }
        XCTAssertNotNil(CommonFunctionality.resizeImage(image: testImage, newWidth: 10))
    }
}
