//
//  SignupVCTests.swift
//  SwiftIndiaTDDTests
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import XCTest
@testable import SwiftIndiaTDD

class SignupVCTests: XCTestCase {
	var sut: SignupViewController!

    override func setUp() {
        super.setUp()
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		sut = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupViewController
		sut.signupModel = SignupViewModel()
		_ = sut.view
    }

	func test_initialSetup() {
		XCTAssertNotNil(sut.usernameTextField)
		XCTAssertNotNil(sut.passwordTextField)
		XCTAssertNotNil(sut.confirmPasswordTextField)
		XCTAssertNotNil(sut.signupModel)
		XCTAssertNotNil(sut.submitButton)
	}

	func test_textField_delegate() {
		XCTAssertNotNil(sut.usernameTextField.delegate)
		XCTAssertNotNil(sut.passwordTextField.delegate)
		XCTAssertNotNil(sut.confirmPasswordTextField.delegate)
	}

	func test_usernameTextField_textChange() {
		sut.usernameTextField.text = "hello"
		sut.usernameTextField.sendActions(for: .editingChanged)
		XCTAssertEqual(sut.usernameTextField.text, sut.signupModel.usernameField.value)
	}

	func test_passwordTextField_textChange() {
		sut.passwordTextField.text = "helloworld"
		sut.passwordTextField.sendActions(for: .editingChanged)
		XCTAssertEqual(sut.passwordTextField.text, sut.signupModel.passwordField.value)
	}

	func test_confirm_passwordTextField_textChange() {
		sut.confirmPasswordTextField.text = "helloworld"
		sut.confirmPasswordTextField.sendActions(for: .editingChanged)
		XCTAssertEqual(sut.confirmPasswordTextField.text, sut.signupModel.confirmPasswordField.value)
	}

	func test_submitButton_tap_calls_submit() {
		let signupModel = MockSignupModel()
		sut.signupModel = signupModel
		sut.submitButton.sendActions(for: .touchUpInside)
		XCTAssertTrue(signupModel.submitCalled)
	}

	func test_submit_button_active_for_valid_form() {
		sut.usernameTextField.text = "hello"
		sut.usernameTextField.sendActions(for: .editingChanged)

		sut.passwordTextField.text = "helloworld"
		sut.passwordTextField.sendActions(for: .editingChanged)

		sut.confirmPasswordTextField.text = "helloworld"
		sut.confirmPasswordTextField.sendActions(for: .editingChanged)

		XCTAssertTrue(sut.submitButton.isEnabled)
	}

	func test_submit_button_inactive_for_invalid_form() {
		sut.usernameTextField.text = "hello"
		sut.usernameTextField.sendActions(for: .editingChanged)

		sut.passwordTextField.text = "hello"
		sut.passwordTextField.sendActions(for: .editingChanged)

		sut.confirmPasswordTextField.text = "helloworld"
		sut.confirmPasswordTextField.sendActions(for: .editingChanged)

		XCTAssertFalse(sut.submitButton.isEnabled)
	}

	private class MockSignupModel: SignupViewModel {
		var submitCalled = false

		override func submit() {
			super.submit()
			submitCalled = true
		}
	}
}

