//
//  SignupViewModel.swift
//  SwiftIndiaTDD
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import Foundation

class SignupViewModel {
	let signupForm: Form
	let usernameField = FormField<String>(value: "", validator: { string in
		return !string.isEmpty
	})
	let passwordField = FormField<String>(value: "", validator: { string in
		return string.characters.count > 5
	})
	let confirmPasswordField = FormField<String>(value: "", validator: { string in
		return string.characters.count > 5
	})
	var networkManager = NetworkManager()
	
	init() {
		let dependencyValidator: ([FormFieldProtocol]) -> Bool = { formFields in
			let passwordField = formFields[1] as! FormField<String>
			let confirmPasswordField = formFields[2] as! FormField<String>
			return passwordField.value == confirmPasswordField.value
		}
		signupForm = Form(formFields: [usernameField, passwordField, confirmPasswordField], validator: dependencyValidator)
	}

	func submit() {
		networkManager.signup(username: usernameField.value, password: passwordField.value) { (result) in
			switch result {
			case .success:
				print("Signup successful")
			case .error:
				print("Signup error")
			}
		}
	}
}
