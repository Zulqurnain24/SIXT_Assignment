//
//  CarDetailVCTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_CarDetailVCTest: XCTestCase {
    
    var sut: CarDetailVC!
    
    override func setUp() {
        super.setUp()
        
        sut = CarDetailVC()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        sut.viewDidLoad()
    }
    
    func testLoadView() {

        sut.loadView()
    }
}
