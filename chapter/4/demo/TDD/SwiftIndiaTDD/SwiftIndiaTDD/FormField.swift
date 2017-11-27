//
//  FormField.swift
//  SwiftIndiaTDD
//
//  Created by Susmita Horrow on 22/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import Foundation

protocol FormFieldProtocol {
	func isValid() -> Bool
}

class FormField<T>: FormFieldProtocol {
	var value: T
	let validator: (T) -> Bool

	init(value: T, validator: @escaping (T) -> Bool ) {
		self.value = value
		self.validator = validator
	}

	func isValid() -> Bool {
		return self.validator(self.value)
	}
}
