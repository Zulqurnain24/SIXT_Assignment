//
//  SIXT_Assignment_FontsTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_FontsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFonts() {
        XCTAssertNotNil(Fonts.self)
        XCTAssertEqual(Fonts.heading, UIFont(name: "ChalkboardSE-Bold", size: 24.0))
        XCTAssertEqual(Fonts.subheading, UIFont(name: "ChalkboardSE-Regular", size: 18.0))
        XCTAssertEqual(Fonts.body, UIFont(name: "ChalkboardSE-Regular", size: 16.0))
        XCTAssertEqual(Fonts.button, UIFont(name: "ChalkboardSE-Bold", size: 18.0))
        XCTAssertEqual(Fonts.label, UIFont(name: "ChalkboardSE-Regular", size: 18.0))
    }
}
