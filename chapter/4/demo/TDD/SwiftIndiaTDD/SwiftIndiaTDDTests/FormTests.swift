//
//  FormTests.swift
//  SwiftIndiaTDDTests
//
//  Created by Susmita Horrow on 22/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import XCTest
@testable import SwiftIndiaTDD

/* This contains the unit test for Form. A Form consist of a number of FormFields and a closure for validation.
*/

class FormTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testFormInit() {
		let userFormField = FormField<String>(value: "", validator: { string in
			return !string.isEmpty
		})
		let passwordField = FormField<String>(value: "", validator: {  string in
			return string.characters.count > 5
		})
		let confirmPasswordField = FormField<String>(value: "", validator: {  string in
			return string.characters.count > 5
		})

		let dependencyValidator: ([FormFieldProtocol]) -> Bool = { formFields in
			let passwordField = formFields[1] as! FormField<String>
			let confirmPasswordField = formFields[2] as! FormField<String>
			return passwordField.value == confirmPasswordField.value
		}

		let form = Form(formFields: [userFormField, passwordField, confirmPasswordField], validator: dependencyValidator)

		userFormField.value = "abc"
		passwordField.value = "123456"
		confirmPasswordField.value = "123456"
		XCTAssertTrue(form.isValid())

		userFormField.value = "abc"
		passwordField.value = "123"
		confirmPasswordField.value = "12344"
		XCTAssertFalse(form.isValid())

		userFormField.value = "abc"
		passwordField.value = "123456"
		confirmPasswordField.value = "123655"
		XCTAssertFalse(form.isValid())
	}

	func testFormWithTermsAndCondition() {
		let userFormField = FormField<String>(value: "", validator: { string in
			return !string.isEmpty
		})
		let passwordField = FormField<String>(value: "", validator: { string in
			return string.characters.count > 5
		})
		let confirmPasswordField = FormField<String>(value: "", validator: { string in
			return string.characters.count > 5
		})

		let termsRead = FormField<Bool>(value: false) { $0 }

		let dependencyValidator: ([FormFieldProtocol]) -> Bool = { formFields in
			let passwordField = formFields[1] as! FormField<String>
			let confirmPasswordField = formFields[2] as! FormField<String>
			return passwordField.value == confirmPasswordField.value
		}

		let form = Form(formFields: [userFormField, passwordField, confirmPasswordField, termsRead], validator: dependencyValidator)

		userFormField.value = "abc"
		passwordField.value = "123456"
		confirmPasswordField.value = "123456"
		termsRead.value = true
		XCTAssertTrue(form.isValid())

		userFormField.value = "abc"
		passwordField.value = "123456"
		confirmPasswordField.value = "123456"
		termsRead.value = false
		XCTAssertFalse(form.isValid())

		userFormField.value = "abc"
		passwordField.value = "123"
		confirmPasswordField.value = "12344"
		termsRead.value = true
		XCTAssertFalse(form.isValid())

		userFormField.value = "abc"
		passwordField.value = "123456"
		confirmPasswordField.value = "123655"
		termsRead.value = true
		XCTAssertFalse(form.isValid())
	}
}
