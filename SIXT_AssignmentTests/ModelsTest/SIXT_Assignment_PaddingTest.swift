//
//  SIXT_Assignment_PaddingTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_PaddingTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertEqual( Padding.standard, 30.0)
        XCTAssertEqual( Padding.small, 15.0)
    }
}
