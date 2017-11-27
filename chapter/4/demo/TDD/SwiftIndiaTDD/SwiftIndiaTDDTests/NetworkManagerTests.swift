//
//  NetworkManagerTests.swift
//  SwiftIndiaTDDTests
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import XCTest
@testable import SwiftIndiaTDD

class NetworkManagerTests: XCTestCase {
    let sut = NetworkManager()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func test_signup() {
		let expectation = XCTestExpectation(description: "Signup")
		sut.signup(username: "hello", password: "helloworld", completion: { result in
			switch result {
			case .success:
				XCTAssert(true, "SignupSuccessful")
				expectation.fulfill()
			case .error:
				XCTAssert(false, "SignupError")
			}
		})
		wait(for: [expectation], timeout: 30.0)
	}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
