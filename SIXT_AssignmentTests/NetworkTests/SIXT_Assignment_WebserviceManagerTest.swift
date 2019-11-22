//
//  SIXT_Assignment_WebserviceManagerTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//
import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_WebserviceManagerTest: XCTestCase {
    
    var sut: WebserviceManager!
    
    override func setUp() {
        super.setUp()
        
        sut = WebserviceManager()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testIsListNotNil() {
        XCTAssertNotNil(sut)
    }

    func testFetchServiceList() {
        let expectation = self.expectation(description: "Cars")
        var carListFromWebservice: [Car]!
        sut.getCarsList({ results in
            switch results {
            case .Success(let value):
                XCTAssertNotNil(value)
                carListFromWebservice = value
                expectation.fulfill()
                break
            case .Failure(_):
                carListFromWebservice = []
                expectation.fulfill()
                XCTFail()
                break
                
        }})
        
        self.waitForExpectations(timeout: 10, handler: nil)
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Cars", withExtension: "json") else {
            XCTFail("Missing file: Cars.json")
            return
        }
        let data = try! Data(contentsOf: url)
        let carListFromJSONFile = try! JSONDecoder().decode([Car].self, from: data)
        XCTAssertEqual(carListFromJSONFile.count, carListFromWebservice.count)
    }
}
