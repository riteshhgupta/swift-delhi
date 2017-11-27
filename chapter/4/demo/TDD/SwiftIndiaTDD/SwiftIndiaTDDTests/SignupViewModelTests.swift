//
//  SignupViewModelTests.swift
//  SwiftIndiaTDDTests
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import XCTest
@testable import SwiftIndiaTDD

class SignupViewModelTests: XCTestCase {

	let sut = SignupViewModel()
	private let mockNetworkManager = MockNetworkManager()

    override func setUp() {
        super.setUp()
		sut.networkManager = mockNetworkManager
    }

	func testInit() {
		XCTAssertNotNil(sut.signupForm)
		XCTAssertNotNil(sut.usernameField)
		XCTAssertNotNil(sut.passwordField)
		XCTAssertNotNil(sut.confirmPasswordField)
	}

	func test_submit_should_call_signup() {
		sut.submit()
		XCTAssert(mockNetworkManager.submitCalled)

	}
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	private class MockNetworkManager: NetworkManager {
		var submitCalled = false
		override func signup(username: String, password: String, completion:  @escaping (Result<Bool>) -> ()) {
			submitCalled = true
			super.signup(username: username, password: password, completion: completion)
		}
	}
}
