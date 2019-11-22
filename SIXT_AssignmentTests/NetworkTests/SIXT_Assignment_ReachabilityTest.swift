//
//  CarListReachabilityTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_ReachabilityTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testReachability() {
        XCTAssertEqual(Reachability.isConnectedToNetwork(), true)
    }
}
