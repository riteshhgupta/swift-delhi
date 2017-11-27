//
//  Form.swift
//  SwiftIndiaTDD
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import Foundation

class Form {
	let formFields: [FormFieldProtocol]
	let validator: ([FormFieldProtocol]) -> Bool

	init(formFields: [FormFieldProtocol], validator: @escaping ([FormFieldProtocol]) -> Bool) {
		self.formFields = formFields
		self.validator = validator
	}

	func isValid() -> Bool {
		var result = true
		formFields.forEach { field in
			result = result && field.isValid()
		}
		result = result && validator(formFields)
		return result
	}
}
