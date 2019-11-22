//
//  CarListEndpointTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_EndpointTes: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testEndpoint() {
        XCTAssertEqual(baseUrl, "https://cdn.sixt.io/codingtask/")
        XCTAssertEqual(Endpoint.cars.rawValue, "cars")
    }
}
