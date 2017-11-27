//
//  FormFieldTests.swift
//  SwiftIndiaTDDTests
//
//  Created by Susmita Horrow on 21/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import XCTest
@testable import SwiftIndiaTDD

/* This contains the unit test for FormField. A FormField is hold some value and applies a validator function to check if the value in the formfield is valid or not.
*/

class FormFieldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func test_FormField_TestInit_String() {
		let validatingFunction: (String) -> Bool = { string in
			return string.characters.count > 5
		}
		let formField = FormField<String>(value: "abc", validator: validatingFunction)
		XCTAssert(formField.value == "abc")

		formField.value = "swiftIndia"
		XCTAssert(formField.value == "swiftIndia")
	}

	func test_FormField_TestInit_Int() {
		let validatingFunction: (Int) -> Bool = { number in
			return number > 5
		}
		let formField = FormField<Int>(value: 6, validator: validatingFunction)
		XCTAssert(formField.value == 6)

		formField.value = 7
		XCTAssert(formField.value == 7)
	}

	func test_FormField_IsValid_String() {
		let validatingFunction: (String) -> Bool = { string in
			return string.characters.count > 5
		}
		let formField = FormField<String>(value: "abc", validator: validatingFunction)
		XCTAssertFalse(formField.isValid())

		formField.value = "swiftIndia"
		XCTAssertTrue(formField.isValid())
	}

	func test_FormField_IsValid_Int() {
		let validatingFunction: (Int) -> Bool = { number in
			return number > 5
		}

		let formField = FormField<Int>(value: 6, validator: validatingFunction)
		XCTAssertTrue(formField.isValid())

		formField.value = 2
		XCTAssertFalse(formField.isValid())
	}

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
