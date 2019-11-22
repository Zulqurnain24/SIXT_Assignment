//
//  CarListUIImageView_NetworkingTest.swift
//  SIXT_AssignmentTests
//
//  Created by Mohammad Zulqarnain on 22/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import SIXT_Assignment

class SIXT_Assignment_UIImageView_NetworkingTest: XCTestCase {
    
    var sut: UIImageView!
    
    override func setUp() {
        super.setUp()
        
        sut = UIImageView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testDownloadImage() {
        let expectation = self.expectation(description: "downloadedImage")
        sut.imageFromServerURL(urlString: "https://cdn.sixt.io/codingtask/images/mini.png", completionHandler: {
            XCTAssertNotNil(self.sut.image)
            XCTAssertEqual(UIImage(named: "mini.png")?.size, self.sut.image?.size)
             XCTAssertEqual(UIImage(named: "mini.png")?.jpegData(compressionQuality: 1.0), self.sut.image?.jpegData(compressionQuality: 1.0))
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 5, handler: nil)
        
    }
}
